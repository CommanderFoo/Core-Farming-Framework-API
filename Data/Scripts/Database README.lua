--[[
     _____        _        _
    |  __ \      | |      | |
    | |  | | __ _| |_ __ _| |__   __ _ ___  ___
    | |  | |/ _` | __/ _` | '_ \ / _` / __|/ _ \
    | |__| | (_| | || (_| | |_) | (_| \__ \  __/
    |_____/ \__,_|\__\__,_|_.__/ \__,_|___/\___|

    ------------------------------
    ---        OVERVIEW        ---
    ------------------------------

    These Databases can be added anywhere in the hierarchy (In Default Context) and they will automatically
    parse any folders, groups, scripts and their children into a set of nested data. This data can then be
    accessed though the APIDatabase.

    You can have as many of these in your scene as you want. They will all merge their data together where
    you can access it easily in scripts.

    If you have any questions or feedback please feel free to let us know!

        - Creators Discord: https://discord.gg/core-creators
        - Forums: https://forums.coregames.com/

    ------------------------------
    ---    DATA TABLE SETUP    ---
    ------------------------------

    To add data drag an instance of the "DataGroup" script under "Database". This will reference a Data Table and become
    a collection of data under a specific category.

    Name the DataGroup in a way that you would like to access it. For example, you could create a group called "Items"
    and it would then be accessable by using the below code on the server or client:

        local DATABASE = require(script:GetCustomProperty("APIDatabase"))
        print(DATABASE.Items) -- This is just an empty table

    Create a new Data Table, or drop an existing one into the "DataTable" custom property on the "DataGroup". Now you
    can freely add columns and rows to your Data Table and they will become accessible in the same way that the above
    code snippet shows.

    For example, if your table in the "Items" DataGroup contains the following data:

    -----------------------------
    | Name   | Description      |
    |--------+------------------|
    | Sword  | A sharp sword.   |
    | Shield | A round buckler. |
    -----------------------------

    local DATABASE = require(script:GetCustomProperty("APIDatabase"))
    print(DATABASE.Items["Sword"].Name)      -- prints "Sword"
    print(DATABASE.Items.Shield.Description) -- prints "A round buckler."

    NOTE: In the above example, the "Name" column has been set to be the "Key Column" for this table. A Data Table
    without a Key Column will be added to the Database as a numeric table and will need to accessed by row index.

    ------------------------------
    --- HIERARCHY BASED SETUP  ---
    ------------------------------

    To add data just create a group or script under "Database". This can act as a collection of similar
    datas if it contains children, or it can be a data entry itself if it has Custom Properties.

    NOTE: Folders are not added as data or categories an can instead be used to organize your data.
    They will be totally ignored by the system in terms of data structure.

    Name it in a way that you would like to access it. For example, you could create a group called "Items" and
    it would then be accessable by using the below code on the server or client:

        local DATABASE = require(script:GetCustomProperty("APIDatabase"))
        print(DATABASE.Items) -- This is just an empty table

    Next you can add children to the Items group. Each child will become available in the Database. If the child
    has any Custom properties on it these will automatically become available as well.

        Database
        |___ Items
            |___ Item1 (Name Custom property = "Sword")
            |___ Item2 (Name Custom property = "Shield")

        local DATABASE = require(script:GetCustomProperty("APIDatabase"))
        print(DATABASE.Items["Item1"].Name) -- prints "Sword"
        print(DATABASE.Items.Item2.Name)    -- prints "Shield"

    You can use any combination of folders, groups and scripts and lay out your data however you want.

    NOTE: If a group has both Custom properties and children, pairs() will include them both so you will need to
    check the type of the value as you iterate if you are only looking for child data:

        local DATABASE = require(script:GetCustomProperty("APIDatabase"))
        for key, value in pairs(DATABASE.Items) do
            if type(value) == "table" then
                -- Found child data
            end
        end
--]]