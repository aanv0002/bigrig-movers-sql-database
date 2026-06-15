// *****PLEASE ENTER YOUR DETAILS BELOW*****
// T6-brm-mongo.mongodb.js

// Student ID: 35737476
// Student Name: Amra Anver

// ===================================================================================
// DO NOT modify or remove any of the comments below (items marked with //)
// Do not use .pretty() in your code, it is not required
//
// -- Submission Declaration - must not be removed - removal will result in no marks being awarded --
// In submitting this SQL script, I confirm that this is my own work without coding assistance from Generative AI
// ===================================================================================

// Use (connect to) your database - you MUST update xyz001
// with your authcate username

use("aanv0002");

// (b)
// PLEASE PLACE REQUIRED MONGODB COMMAND TO CREATE THE COLLECTION HERE
// YOU MAY PICK ANY COLLECTION NAME
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// Drop collection
db.customerquotes.drop();

// Create collection and insert documents
db.customerquotes.insertMany([{
    "_id": 1,
    "customer_name": "Michael Benjamin",
    "customer_business": "FreshBox",
    "customer_address": "55 Lonsdale Street, Melbourne 3008",
    "customer_phone": "0478901017",
    "customer_stats": {
        "number_of_quotes": 6,
        "number_of_jobs": 5,
        "total_paid_jobcost": "$8300.00",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": 1,
            "quote_prepared_on": "01-May-2026",
            "start_location": "Melbourne WH",
            "end_location": "Sydney Hub",
            "quote_cost": "   $1200.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1200.00"
        },
        {
            "quote_no": 26,
            "quote_prepared_on": "02-Jul-2026",
            "start_location": "Adelaide Port",
            "end_location": "Sydney Hub",
            "quote_cost": "   $2100.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        },
        {
            "quote_no": 5,
            "quote_prepared_on": "20-May-2026",
            "start_location": "Brisbane Depot",
            "end_location": "Sydney Hub",
            "quote_cost": "   $1500.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1500.00"
        },
        {
            "quote_no": 4,
            "quote_prepared_on": "15-May-2026",
            "start_location": "Sydney Hub",
            "end_location": "Melbourne WH",
            "quote_cost": "   $1200.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1100.00"
        },
        {
            "quote_no": 3,
            "quote_prepared_on": "10-May-2026",
            "start_location": "Geelong Plant",
            "end_location": "Adelaide Port",
            "quote_cost": "   $1800.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1800.00"
        },
        {
            "quote_no": 2,
            "quote_prepared_on": "02-May-2026",
            "start_location": "Melbourne WH",
            "end_location": "Brisbane Depot",
            "quote_cost": "   $2500.00",
            "assigned_to_job": "Y",
            "job_cost": "   $2700.00"
        }
    ]
},
{
    "_id": 2,
    "customer_name": "James ",
    "customer_business": "J Wood and Gravel",
    "customer_address": "15 George Street, Sydney 2000",
    "customer_phone": "0412345001",
    "customer_stats": {
        "number_of_quotes": 6,
        "number_of_jobs": 5,
        "total_paid_jobcost": "$7700.00",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": 6,
            "quote_prepared_on": "01-May-2026",
            "start_location": "Sydney Port",
            "end_location": "Newcastle Yard",
            "quote_cost": "    $800.00",
            "assigned_to_job": "Y",
            "job_cost": "    $950.00"
        },
        {
            "quote_no": 27,
            "quote_prepared_on": "06-Jul-2026",
            "start_location": "Sydney Hub",
            "end_location": "Adelaide Port",
            "quote_cost": "   $2100.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        },
        {
            "quote_no": 10,
            "quote_prepared_on": "25-May-2026",
            "start_location": "Melbourne WH",
            "end_location": "Adelaide Port",
            "quote_cost": "   $1900.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1750.00"
        },
        {
            "quote_no": 9,
            "quote_prepared_on": "19-May-2026",
            "start_location": "Newcastle Yard",
            "end_location": "Sydney Port",
            "quote_cost": "    $800.00",
            "assigned_to_job": "Y",
            "job_cost": "    $800.00"
        },
        {
            "quote_no": 8,
            "quote_prepared_on": "12-May-2026",
            "start_location": "Wollongong Plant",
            "end_location": "Brisbane Depot",
            "quote_cost": "   $2700.00",
            "assigned_to_job": "Y",
            "job_cost": "   $2900.00"
        },
        {
            "quote_no": 7,
            "quote_prepared_on": "05-May-2026",
            "start_location": "Sydney Port",
            "end_location": "Melbourne WH",
            "quote_cost": "   $1300.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1300.00"
        }
    ]
},
{
    "_id": 3,
    "customer_name": " Brook",
    "customer_business": "Western Chocolatery",
    "customer_address": "23 Murray Street, Perth 6000",
    "customer_phone": "0445678004",
    "customer_stats": {
        "number_of_quotes": 6,
        "number_of_jobs": 5,
        "total_paid_jobcost": "$10500.00",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": 11,
            "quote_prepared_on": "01-Jun-2026",
            "start_location": "Perth Hub",
            "end_location": "Fremantle Port",
            "quote_cost": "    $600.00",
            "assigned_to_job": "Y",
            "job_cost": "    $600.00"
        },
        {
            "quote_no": 28,
            "quote_prepared_on": "12-Jul-2026",
            "start_location": "Perth Hub",
            "end_location": "Sydney Port",
            "quote_cost": "   $4100.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        },
        {
            "quote_no": 15,
            "quote_prepared_on": "20-Jun-2026",
            "start_location": "Melbourne WH",
            "end_location": "Perth Hub",
            "quote_cost": "   $3400.00",
            "assigned_to_job": "Y",
            "job_cost": "   $3400.00"
        },
        {
            "quote_no": 14,
            "quote_prepared_on": "15-Jun-2026",
            "start_location": "Adelaide Port",
            "end_location": "Melbourne WH",
            "quote_cost": "   $1900.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1900.00"
        },
        {
            "quote_no": 13,
            "quote_prepared_on": "10-Jun-2026",
            "start_location": "Fremantle Port",
            "end_location": "Kalgoorlie Site",
            "quote_cost": "   $1400.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1400.00"
        },
        {
            "quote_no": 12,
            "quote_prepared_on": "04-Jun-2026",
            "start_location": "Perth Hub",
            "end_location": "Adelaide Port",
            "quote_cost": "   $3200.00",
            "assigned_to_job": "Y",
            "job_cost": "   $3200.00"
        }
    ]
},
{
    "_id": 4,
    "customer_name": "Alexander Noah",
    "customer_business": "-",
    "customer_address": "56 Bourke Street, Melbourne 3001",
    "customer_phone": "0478901007",
    "customer_stats": {
        "number_of_quotes": 6,
        "number_of_jobs": 5,
        "total_paid_jobcost": "$6400.00",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": 16,
            "quote_prepared_on": "01-Jun-2026",
            "start_location": "Melbourne WH",
            "end_location": "Ballarat Yard",
            "quote_cost": "    $500.00",
            "assigned_to_job": "Y",
            "job_cost": "    $500.00"
        },
        {
            "quote_no": 29,
            "quote_prepared_on": "15-Jul-2026",
            "start_location": "Darwin Depot",
            "end_location": "Melbourne WH",
            "quote_cost": "   $5500.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        },
        {
            "quote_no": 20,
            "quote_prepared_on": "24-Jun-2026",
            "start_location": "Brisbane Depot",
            "end_location": "Melbourne WH",
            "quote_cost": "   $2600.00",
            "assigned_to_job": "Y",
            "job_cost": "   $2600.00"
        },
        {
            "quote_no": 19,
            "quote_prepared_on": "18-Jun-2026",
            "start_location": "Sydney Hub",
            "end_location": "Brisbane Depot",
            "quote_cost": "   $1600.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1600.00"
        },
        {
            "quote_no": 18,
            "quote_prepared_on": "12-Jun-2026",
            "start_location": "Ballarat Yard",
            "end_location": "Bendigo Plant",
            "quote_cost": "    $450.00",
            "assigned_to_job": "Y",
            "job_cost": "    $450.00"
        },
        {
            "quote_no": 17,
            "quote_prepared_on": "05-Jun-2026",
            "start_location": "Melbourne WH",
            "end_location": "Sydney Hub",
            "quote_cost": "   $1250.00",
            "assigned_to_job": "Y",
            "job_cost": "   $1250.00"
        }
    ]
},
{
    "_id": 5,
    "customer_name": "Jack Ethan",
    "customer_business": "-",
    "customer_address": "61 Ann Street, Brisbane 4101",
    "customer_phone": "0434567013",
    "customer_stats": {
        "number_of_quotes": 6,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": 23,
            "quote_prepared_on": "10-Jul-2026",
            "start_location": "Gold Coast Hub",
            "end_location": "Toowoomba Yard",
            "quote_cost": "    $850.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        },
        {
            "quote_no": 24,
            "quote_prepared_on": "15-Jul-2026",
            "start_location": "Sydney Hub",
            "end_location": "Melbourne WH",
            "quote_cost": "   $1300.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        },
        {
            "quote_no": 25,
            "quote_prepared_on": "20-Jul-2026",
            "start_location": "Melbourne WH",
            "end_location": "Brisbane Depot",
            "quote_cost": "   $2550.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        },
        {
            "quote_no": 22,
            "quote_prepared_on": "04-Jul-2026",
            "start_location": "Brisbane Depot",
            "end_location": "Sydney Hub",
            "quote_cost": "   $1550.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        },
        {
            "quote_no": 21,
            "quote_prepared_on": "01-Jul-2026",
            "start_location": "Brisbane Depot",
            "end_location": "Gold Coast Hub",
            "quote_cost": "    $700.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        },
        {
            "quote_no": 30,
            "quote_prepared_on": "18-Jul-2026",
            "start_location": "Hobart Port",
            "end_location": "Sydney Hub",
            "quote_cost": "   $3200.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 6,
    "customer_name": "Sophie Amelia",
    "customer_business": "-",
    "customer_address": "29 Barrack Street, Perth 6009",
    "customer_phone": "0445678014",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 7,
    "customer_name": "Kate Evelyn",
    "customer_business": "Miller Co.",
    "customer_address": "72 Cavill Avenue, Brisbane 4217",
    "customer_phone": "0489012018",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 8,
    "customer_name": "Emma ",
    "customer_business": "Kreate Curtain",
    "customer_address": "42 Collins Street, Melbourne 3000",
    "customer_phone": "0423456002",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 9,
    "customer_name": " William",
    "customer_business": "Best Fruit and Veg",
    "customer_address": "67 King William Street, Adelaide 5000",
    "customer_phone": "0456789005",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 10,
    "customer_name": " Grace",
    "customer_business": "-",
    "customer_address": "45 Rundle Mall, Adelaide 5006",
    "customer_phone": "0401234010",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 11,
    "customer_name": "Rose Isabella",
    "customer_business": "-",
    "customer_address": "34 Adelaide Street, Brisbane 4006",
    "customer_phone": "0489012008",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 12,
    "customer_name": "Robert James",
    "customer_business": "Wilson Confectionery",
    "customer_address": "38 Wellington Street, Perth 6107",
    "customer_phone": "0490123019",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 13,
    "customer_name": "Oliver ",
    "customer_business": "Williams Co.",
    "customer_address": "88 Queen Street, Brisbane 4000",
    "customer_phone": "0434567003",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 14,
    "customer_name": " Price",
    "customer_business": "Garcia Frozen",
    "customer_address": "101 Pitt Street, Sydney 2010",
    "customer_phone": "0467890006",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 15,
    "customer_name": "Thomas ",
    "customer_business": "-",
    "customer_address": "78 Hay Street, Perth 6003",
    "customer_phone": "0490123009",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 16,
    "customer_name": "Henry Lucas",
    "customer_business": "-",
    "customer_address": "92 Oxford Street, Sydney 2060",
    "customer_phone": "0412345011",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 17,
    "customer_name": "Lily Charlotte",
    "customer_business": "-",
    "customer_address": "18 Chapel Street, Melbourne 3004",
    "customer_phone": "0423456012",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 18,
    "customer_name": "Victoria Ella",
    "customer_business": "Flintstone Store",
    "customer_address": "94 Henley Beach Road, Adelaide 5095",
    "customer_phone": "0401234020",
    "customer_stats": {
        "number_of_quotes": 1,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": 300,
            "quote_prepared_on": "17-May-2026",
            "start_location": "29 Kuranda Road, Adelaide SA 5030",
            "end_location": "9 Albatros Drive, Mount Gambier SA 5270",
            "quote_cost": "   $1000.00",
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 19,
    "customer_name": "Daniel Mason",
    "customer_business": "-",
    "customer_address": "83 Jetty Road, Adelaide 5063",
    "customer_phone": "0456789015",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
},
{
    "_id": 20,
    "customer_name": "Emily Harper",
    "customer_business": "-",
    "customer_address": "127 Parramatta Road, Sydney 2150",
    "customer_phone": "0467890016",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": [
        {
            "quote_no": null,
            "quote_prepared_on": null,
            "start_location": null,
            "end_location": null,
            "quote_cost": null,
            "assigned_to_job": "N",
            "job_cost": "-"
        }
    ]
}]);

// List all documents you added
db.customerquotes.find();

// (c)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer
db.customerquotes.find(
    {
        "$and": [
            { "customer_address": /.*Melbourne.*/ },
            // here the $gt has been taken from allowed predicate operators from slide 38 pre workshop 11
            { "customer_stats.number_of_quotes": { "$gt": 2 } }
        ]
    },
    {
        "_id": 1,
        "customer_name": 1,
        "customer_address": 1,
        "customer_phone": 1,
        //the dot used here represents a sub document similar to the enrolmentInfo.unitcode from Applied 12
        "customer_stats.number_of_quotes": 1,
        "customer_stats.number_of_jobs": 1,
        "customer_stats.total_paid_jobcost": 1,
        "customer_stats.total_unpaid_jobcost": 1
    }
);


//upon running, data was found, ids 1 and 4, therefore task 2 was not edited.

// (d)
// PLEASE PLACE REQUIRED MONGODB COMMAND/S FOR THIS PART HERE
// ENSURE that your query is formatted and has a semicolon
// (;) at the end of this answer

// (i)  Add the new customer
db.customerquotes.insertOne({
    "_id": 1001,
    "customer_name": "Patrick Bosse",
    "customer_business": "-",
    "customer_address": "45 Collins Street, Melbourne VIC 3000",
    "customer_phone": "0422888999",
    "customer_stats": {
        "number_of_quotes": 0,
        "number_of_jobs": 0,
        "total_paid_jobcost": "-",
        "total_unpaid_jobcost": "-"
    },
    "quotes": []
});

// Show the customer details
db.customerquotes.find(
    { "_id": 1001 }
);

// (ii) Add new quote

//no manual calculations have been made for this task
//it has been assumed that Patrick Bosse has not made any other quotes
//necessary updates have been made referring to Applied 12-2 4(b) and 5.
db.customerquotes.updateOne(
    { "_id": 1001 },
    {
        "$set":
        {
            "customer_stats.number_of_quotes": 1,
            "customer_stats.number_of_jobs": 1,
            "customer_stats.total_paid_jobcost": "$3200.00",
            "customer_stats.total_unpaid_jobcost": "-"
        },

        "$push": {
            "quotes": {
                "quote_no": 2002,
                "quote_prepared_on": "15-Jun-2026",
                "preferred_start_date": "22-Jun-2026",
                "start_location": "Adelaide SA",
                "end_location": "Melbourne VIC",
                "quote_cost": "$3200.00",
                "assigned_to_job": "Y",
                "job_cost": "$3200.00"
            }
        }

    }
);

// Show the customer details
db.customerquotes.find(
    { "_id": 1001 }
);

// End of file - do not remove
