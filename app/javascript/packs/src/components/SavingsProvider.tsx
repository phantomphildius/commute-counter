import React from 'react';
import useFetch from '../api';
import { Savings } from '../data';

interface SavingsContext {
  data: Savings | undefined;
  loading: boolean;
}

export const SavingsContext = React.createContext<SavingsContext | null>(null);

export const SavingsProvider: React.FC = ({ children }) => {
  const { data, loading } = useFetch<Savings>('/commute/savings', null);

  return (
    <SavingsContext.Provider value={{ data, loading }}>
      {children}
    </SavingsContext.Provider>
  );
};

export const useSavings = (): SavingsContext => {
  const context = React.useContext(SavingsContext);
  if (!context) {
    throw new Error('useSavings must be used under SavingsProvider.');
  }
  return context;
};
