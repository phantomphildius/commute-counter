import React from 'react';
import Button from '@material-ui/core/Button';

interface Props {
  activityId: string;
}

const ActivityItemUpdateButtons: React.FC<Props> = ({ activityId }) => (
  <>
    <p>Ways to update activity {activityId}</p>
    <Button variant="outlined" color="primary">
      refresh activity
    </Button>
    <Button variant="outlined" color="secondary">
      delete activity
    </Button>
  </>
);

export default ActivityItemUpdateButtons;
