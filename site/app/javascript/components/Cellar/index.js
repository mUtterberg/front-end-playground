import React from "react";
import { Query } from "react-apollo";
import gql from 'graphql-tag';

const CellarQuery = gql`
    {
        distilleries {
            id
            name
            producer {
                name
            }
        }
    }
`;

export default () => (
    <Query query={CellarQuery}>
        {({ data, loading }) => (
            <div>
                {loading
                    ? 'loading...'
                    : data.distilleries.map(({ name, id, producer }) => (
                        <div key={id}>
                            <b>{name}</b> { producer ? `produced by ${producer.name}` : null}
                        </div>
                    ))
                }
            </div>
        )}
    </Query>
);
