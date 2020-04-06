import React from 'react';
import currency from 'currency.js';
import ListItem from '@material-ui/core/ListItem';
import Paper from '@material-ui/core/Paper';

interface Props {
  name: string;
  remainingSavings: number;
}

const CostItem: React.FC<Props> = ({ name, remainingSavings }) => {
  const formatRemainingGearCost = (remainder: number): string =>
    currency(remainder, { formatWithSymbol: true }).divide(100).format();
  const buildGearMessage = (remaining: number, name: string): string => {
    return remainingSavings == 0
      ? `you paid off ${name}!`
      : `you have ${formatRemainingGearCost(
          remaining
        )} left to pay off ${name}`;
  };

  return (
    <ListItem>
      <Paper>{buildGearMessage(remainingSavings, name)}</Paper>
    </ListItem>
  );
};

export default CostItem;
