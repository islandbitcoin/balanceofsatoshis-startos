import { compat, types as T } from "../deps.ts";

export const migration: T.ExpectedExports.migration = compat.migrations
  .fromMapping( {}, "14.0.0" );
