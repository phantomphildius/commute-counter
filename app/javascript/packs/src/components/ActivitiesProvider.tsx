import React from 'react';
import useFetch from '../api';
import { Activity } from '../data';

interface ActivitiesContext {
  data: Activity[] | undefined;
  loading: boolean;
}

export const ActivitiesContext = React.createContext<ActivitiesContext | null>(
  null
);

export const ActivitiesProvider: React.FC = ({ children }) => {
  const { data, loading } = useFetch<Activity[]>('/commute/activities', []);

  return (
    <ActivitiesContext.Provider value={{ data, loading }}>
      {children}
    </ActivitiesContext.Provider>
  );
};

export const useActivities = (): ActivitiesContext => {
  const context = React.useContext(ActivitiesContext);
  if (!context) {
    throw new Error('useActivities must be used under ActivitiesProvider.');
  }
  return context;
};
