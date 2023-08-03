import graphql from 'babel-plugin-relay/macro';

export const AllLinksQuery = graphql`  
  query LinksQuery {
    allLinks {
      id
      description
      url
    }
  }
`;