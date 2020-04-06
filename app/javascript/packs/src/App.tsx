import React from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import Container from '@material-ui/core/Container';
import Header from './components/Header';
import Grid from '@material-ui/core/Grid';
import ActivityFeed from './components/ActivityFeed';
import CostFeed from './components/CostFeed';
import { ActivitiesProvider } from './components/ActivitiesProvider';
import { SavingsProvider } from './components/SavingsProvider';

const CommuteCounter: React.FC = () => {
  return (
    <>
      <CssBaseline />
      <Container>
        <ActivitiesProvider>
          <SavingsProvider>
            <Header />
            <Grid container>
              <Grid item xs={6}>
                <ActivityFeed />
              </Grid>
              <Grid item xs={6}>
                <CostFeed />
              </Grid>
            </Grid>
          </SavingsProvider>
        </ActivitiesProvider>
      </Container>
    </>
  );
};

export default CommuteCounter;
