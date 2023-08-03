import React from 'react';
import RelayEnvironment from './utils/RelayEnvironment';
import GraphqlTry from './components/graphqlTry';
import { 
  usePreloadedQuery, 
  loadQuery,
  RelayEnvironmentProvider,
} from 'react-relay/hooks';
import { AllLinksQuery } from './utils/LinksQuery.graphql';

const { Suspense } = React;

const preloadedQuery = loadQuery(RelayEnvironment, AllLinksQuery, {});


function App() {
  const data = usePreloadedQuery(AllLinksQuery, preloadedQuery);
  // console.log(data);
  
  return (
    <div className="App">
      {data.allLinks.map(({ id, url, description }) => (
        <div key={id}>
          <p>
            {url}: {description}
          </p>
        </div>
      ))}
      <GraphqlTry />
    </div>
  );
}

function AppRoot(props) {
  return (
    <RelayEnvironmentProvider environment={RelayEnvironment}>
      <Suspense fallback={'Loading...'}>
        <App preloadedQuery={preloadedQuery} />
      </Suspense>
    </RelayEnvironmentProvider>
  );
}

export default AppRoot;
