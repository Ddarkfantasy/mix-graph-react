/**
 * @generated SignedSource<<107595a18f4a3d98d6ed57eada896219>>
 * @lightSyntaxTransform
 * @nogrep
 */

/* eslint-disable */

'use strict';

var node = (function(){
var v0 = [
  {
    "alias": null,
    "args": null,
    "concreteType": "Link",
    "kind": "LinkedField",
    "name": "allLinks",
    "plural": true,
    "selections": [
      {
        "alias": null,
        "args": null,
        "kind": "ScalarField",
        "name": "id",
        "storageKey": null
      },
      {
        "alias": null,
        "args": null,
        "kind": "ScalarField",
        "name": "description",
        "storageKey": null
      },
      {
        "alias": null,
        "args": null,
        "kind": "ScalarField",
        "name": "url",
        "storageKey": null
      }
    ],
    "storageKey": null
  }
];
return {
  "fragment": {
    "argumentDefinitions": [],
    "kind": "Fragment",
    "metadata": null,
    "name": "LinksQuery",
    "selections": (v0/*: any*/),
    "type": "RootQueryType",
    "abstractKey": null
  },
  "kind": "Request",
  "operation": {
    "argumentDefinitions": [],
    "kind": "Operation",
    "name": "LinksQuery",
    "selections": (v0/*: any*/)
  },
  "params": {
    "cacheID": "540a8f64f5d93aa143a657480ec6992e",
    "id": null,
    "metadata": {},
    "name": "LinksQuery",
    "operationKind": "query",
    "text": "query LinksQuery {\n  allLinks {\n    id\n    description\n    url\n  }\n}\n"
  }
};
})();

node.hash = "5cc74a4e72053dbe00225399a864c6db";

module.exports = node;
