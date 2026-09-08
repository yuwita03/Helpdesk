-- name: CreateTenant :one
INSERT INTO tenants (name, subdomain)
VALUES ($1, $2)
RETURNING *;

-- name: GetTenantBySubdomain :one
SELECT * FROM tenants
WHERE subdomain = $1
LIMIT 1;

-- name: GetTenantByID :one
SELECT * FROM tenants
WHERE id = $1
LIMIT 1;

-- name: ListTenants :many
SELECT * FROM tenants
ORDER BY created_at DESC;