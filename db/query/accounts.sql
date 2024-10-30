-- name: Create_account :one
INSERT INTO accounts (
  owner,
  balance,
  currency
) VALUES (
  $1, $2, $3
) RETURNING *;

-- name: Get_account :one
SELECT * FROM accounts
WHERE id = $1 LIMIT 1;

-- name: List_accounts :many
SELECT * FROM accounts
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: Update_accounts :exec
UPDATE accounts
SET balance = $2
WHERE id = $1;

-- name: Delete_account :exec
DELETE FROM accounts
WHERE id = $1;
