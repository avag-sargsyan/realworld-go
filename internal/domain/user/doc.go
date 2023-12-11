// Package user specifies:
//   - user-specific domain types;
//   - a service interface and corresponding implementation, for injection
//     into inbound methods;
//   - an outbound interface describing a store of user data.
package user

import "github.com/angusgmorrison/realworld-go/internal/inbound/rest/server"

var jwt server.Config
