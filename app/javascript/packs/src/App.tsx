import React from 'react';
import CssBaseline from '@material-ui/core/CssBaseline';
import Container from '@material-ui/core/Container';
import Header from './components/Header';
import ActivityFeed from './components/ActivityFeed';
import { ActivitiesProvider } from './components/ActivitiesProvider';

const CommuteCounter: React.FC = () => {
  return (
    <>
      <CssBaseline />
      <Container>
        <ActivitiesProvider>
          <Header />
          <ActivityFeed />
        </ActivitiesProvider>
      </Container>
    </>
  );
};

export default CommuteCounter;
