import React, { useEffect, useState } from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import Box from '@material-ui/core/Box';
import Container from '@material-ui/core/Container';
import axios from 'axios';
import List from '@material-ui/core/ListItem';
import ListItem from '@material-ui/core/ListItem';

interface Activity {
  name: string;
  id: string;
  distance: number;
}

interface Savings {
  cost: number;
}

interface Response<T> {
  data?: T;
  loading: boolean;
}

function useFetch<T>(url: string, initialValue: [] | null): Response<T> {
  const client = axios.create({
    responseType: 'json',
    headers: { 'Content-Type': 'application/json', Accept: 'application/json' }
  });
  const [data, setData] = useState(initialValue);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchData = async function() {
      try {
        setLoading(true);
        const response = await client.get(url);
        if (response.status === 200) {
          setData(response.data);
        }
      } catch (error) {
        throw error;
      } finally {
        setLoading(false);
      }
    };
    fetchData();
  }, [url]);

  return { loading, data };
}

const CommuteCounter: React.FC = () => {
  const { data: activities, loading: loadingActivities } = useFetch<Activity[]>(
    '/commute/activities',
    []
  );
  const { data: savings, loading: loadingSavings } = useFetch<Savings>(
    '/commute/savings',
    null
  );

  return (
    <>
      <CssBaseline />
      <Box>You have saved {!loadingSavings && savings && savings.cost}</Box>
      {!loadingActivities && activities && (
        <List component="ul">
          {activities.map(activity => {
            return <ListItem key={activity.id}>{activity.name}</ListItem>;
          })}
        </List>
      )}
    </>
  );
};

export default CommuteCounter;
