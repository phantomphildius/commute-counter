import { useEffect, useState } from 'react';
import axios from 'axios';

interface Response<T> {
  data?: T;
  loading: boolean;
}

export default function useFetch<T>(
  url: string,
  initialValue: any
): Response<T> {
  const client = axios.create({
    responseType: 'json',
    headers: { 'Content-Type': 'application/json', Accept: 'application/json' },
  });
  const [data, setData] = useState(initialValue);
  const [loading, setLoading] = useState(true);

  useEffect(() => {
    const fetchData = async function () {
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
