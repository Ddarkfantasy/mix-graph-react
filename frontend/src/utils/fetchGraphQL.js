const fetchGraphQL = async (query, variables = {}) => {
    // Fetch data from GitHub's GraphQL API:
    const response = await fetch('https://headoffice.sydneytools.com.au/api', {
      method: 'POST',
      headers: {
        // 'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Access-Control-Allow-Origin':'*',
      },
      body: JSON.stringify({
        query,
        variables,
      }),
    });
  
    // Get the response as JSON
    return await response.json();
  }
  
  export default fetchGraphQL;