import React from "react";
import fetchGraphQL from "../utils/fetchGraphQL";
import { useState, useEffect } from "react";


function GraphqlTry() {
    const [links, setLinks] = useState([]);

    useEffect(() => {
      let isMounted = true;
      fetchGraphQL(`
        query LinksQuery {
          allLinks {
            id
            url
            description
          }
        }
      `).then(response => {
        if (!isMounted) {
          return;
        }
        
        const data = response.data;
        console.log(data);
        setLinks(data.allLinks);
      }).catch(error => {
        console.error(error);
      });
      
      return () => {
        isMounted = false;
      }
    }, []);
  
    return (
      <div>
        <header className="App-header">
            should print links below
            { links.map(link => (
                <p key={link.id}>{link.description}{"  ==>  "}<a href={link}>{link.url}</a></p>
            ))}
        </header>
      </div>
    );
  }
  
  export default GraphqlTry;