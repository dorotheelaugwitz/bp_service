# BpService API

Part of a microservice environment I wrote for a Uni assignment. It's a REST API for a single resource: Business Processes. I took the chance to practice test-driven web development with Elixir & Phoenix.

## Installation

1. Clone the repository
2. Have a postgres database called "bp_service_test" running with a user "postgres" and password "postgres"
3. Run `mix ecto.create && mix phx.server`

## What this API can do

### GET `/api/v1/business_processes`

Returns a list of created Business Processes

Example response:

`200 OK`

```json
{
  "business_processes": [{
      "updated_at": "2018-05-21T13:22:52.364410",
      "tags": ["SaaS", "Finance"],
      "status": "active",
      "public": true,
      "name": "Create Invoice",
      "inserted_at": "2018-05-21T13:22:52.361747",
      "id": 1,
      "description": null,
      "content": null
    },
    {
      "updated_at": "2018-05-30T06:54:01.040334",
      "tags": null,
      "status": "inactive",
      "public": "false",
      "name": "BP Name",
      "inserted_at": "2018-05-30T06:54:01.040323",
      "id": 2,
      "description": "Example description",
      "content": null
    },
    {
      "updated_at": "2018-05-30T07:38:00.314650",
      "tags": ["Startup", "Monthly Analysis", "Marketing"],
      "status": "active",
      "public": true,
      "name": "Adwords Campaign",
      "inserted_at": "2018-05-30T07:38:00.312191",
      "id": 3,
      "description": "Our monthly analysis process.",
      "content": null
    }
  ]
}
```

### GET `/api/v1/business_processes/:id`

Returns a specific Business Process

Example response:

`200 OK`

```json
{
  "updated_at": "2018-05-30T07:38:00.314650",
  "tags": ["Startup", "Monthly Analysis", "Marketing"],
  "status": "active",
  "public": true,
  "name": "Adwords Campaign",
  "inserted_at": "2018-05-30T07:38:00.312191",
  "id": 3,
  "description": "Our monthly analysis process.",
  "content": null
}
```

### POST `/api/v1/business_processes`

Creates a Business Process with the given attributes. Required attributes are:

* `name`
* `status`
* `public`

Example request body:

```json
{
  "name": "BP Name",
  "description": "BP description",
  "tags": ["tag1", "tag2"],
  "status": "active",
  "public": true,
  "content": "<?xml version="1.0" encoding="UTF-8"?>"
}
```

Example response:

`201 CREATED`

```json
{
  "updated_at": "2018-05-30T07:56:34.542931",
  "tags": [
    "tag1",
    "tag2"
  ],
  "status": "active",
  "public": true,
  "name": "BP Name",
  "inserted_at": "2018-05-30T07:56:34.539762",
  "id": 4,
  "description": "BP description",
  "content": "<?xml version="1.0" encoding="UTF-8"?>"
}
```

### PUT `/api/v1/business_processes/:id`

Updates the given attributes of a specific Business Process

Example request body:

```json
{
  "description": "Updated description",
}
```

Example response:

`200 OK`

```json
{
  "updated_at": "2018-05-30T07:56:34.542931",
  "tags": [
    "tag1",
    "tag2"
  ],
  "status": "active",
  "public": true,
  "name": "BP Name",
  "inserted_at": "2018-05-30T07:56:34.539762",
  "id": 4,
  "description": "Updated description",
  "content": null
}
```

### DELETE `/api/v1/business_processes/:id`

Deletes a specific Business Process.

Returns: `204 NO CONTENT`
