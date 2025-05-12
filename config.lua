QBCore = exports['qb-core']:GetCoreObject() -- Don't touch this.
Config = {}

Config.Peds = {
    {
        coords = vector4(444.07, -986.23, 30.72, 1.93),
        model = "s_m_y_cop_01",
        label = "Police Forms",
        targetLabel = "Talk to the receptionist",
        job = "police",
        webhook = "YOUR_WEBHOOK_HERE",
        forms = {
            {
                id = "incidentreport",
                label = "Incident Report",
                questions = {
                    {type = "input", label = "Full name", required = true},
                    {type = "input", label = "What happened?", required = true},
                    {type = "textarea", label = "Description of the incident", required = false},
                }
            },
            {
                id = "contctmanagement",
                label = "Contact Management",
                questions = {
                    {type = "input", label = "Your name", required = true},
                    {type = "input", label = "Job title/department", required = false},
                    {type = "select", label = "Category of the matter", required = true, options = {
                        {label = "Suggestion", value = "suggestion"},
                        {label = "Complaint", value = "complaint"},
                        {label = "Other", value = "other"}
                    }},
                    {type = "textarea", label = "What is your concern?", required = true},
                    {type = "input", label = "Phone number / contact info", required = false}
                }
            },
            {
                id = "report",
                label = "Report",
                questions = {
                    {type = "input", label = "Your name", required = true},
                    {type = "input", label = "Who do you want to report? (name/description)", required = true},
                    {type = "textarea", label = "What happened?", required = true},
                    {type = "input", label = "Time of the incident", required = false},
                    {type = "input", label = "Location of the incident", required = false},
                    {type = "select", label = "Type of crime", required = false, options = {
                        {label = "Violence", value = "violence"},
                        {label = "Fraud", value = "fraud"},
                        {label = "Traffic violation", value = "traffic"},
                        {label = "Weapons offense", value = "weapons"},
                        {label = "Other", value = "other"}
                    }},
                    {type = "textarea", label = "Any witnesses / evidence", required = false}
                }
            }
        }
    },
    {
        coords = vector4(-601.87, -349.09, 35.24, 85.25),
        model = "cs_martinmadrazo",
        label = "Realestate",
        targetLabel = "Talk to Johnny",
        job = "realestate",
        webhook = "YOUR_WEBHOOK_HERE",
        forms = {
            {
                id = "realestate",
                label = "Real Estate Form",
                questions = {
                    {type = "input", label = "Full name", required = true},
                    {type = "input", label = "Phone number", required = true},
                    {type = "input", label = "What are you interested in? (Apartment, House, Business, etc.)", required = true},
                    {type = "input", label = "Preferred location in the city", required = false},
                    {type = "select", label = "Budget", required = true, options = {
                        {label = "Under $100,000", value = "under_100k"},
                        {label = "$100,000 - $500,000", value = "100k_500k"},
                        {label = "$500,000 - $1,000,000", value = "500k_1m"},
                        {label = "Over $1,000,000", value = "over_1m"}
                    }},
                    {type = "textarea", label = "Additional requests or information", required = false}
                }
            }
        }
    }
}
