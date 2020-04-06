import React, { useState, useEffect } from 'react';
import List from '@material-ui/core/List';
import ListItem from '@material-ui/core/ListItem';
import Paper from '@material-ui/core/Paper';
import Grid from '@material-ui/core/Grid';
import { Cost } from '../data';
import useFetch from '../api';
import { useSavings } from './SavingsProvider';
import CostItem from './CostItem';
import currency from 'currency.js';

const CostFeed: React.FC = () => {
  const { data: costs, loading: loadingCosts } = useFetch<Cost[]>(
    '/commute/costs',
    null
  );
  const { data: savings, loading: loadingSavings } = useSavings();
  const [costSavings, setCostSavings] = useState(0);

  useEffect(() => {
    const intSavings = savings ? currency(savings.cost).intValue : 0;
    setCostSavings(intSavings);
  }, [loadingSavings]);

  const deductGearCost = (gearCost: number): number => {
    return currency(gearCost, { formatWithSymbol: true }).subtract(costSavings)
      .intValue;
  };
  const calculateRemainingSavings = (gearCost: number): number => {
    let remainder = 0;

    if (costSavings > gearCost) {
      remainder = deductGearCost(gearCost);
    }

    // setCostSavings(remainder);
    return remainder;
  };

  return (
    <Grid container>
      {!loadingCosts && !loadingSavings ? (
        <List>
          {costs &&
            costs.map(({ id, name, price_cents }) => (
              <CostItem
                key={id}
                remainingSavings={calculateRemainingSavings(price_cents)}
                name={name}
              />
            ))}
        </List>
      ) : (
        <Paper>Loading costs...</Paper>
      )}
    </Grid>
  );
};

export default CostFeed;
