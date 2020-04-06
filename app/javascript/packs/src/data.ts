export interface Activity {
  id: string;
  name: string;
  distance_miles: number;
  time_elapsed_seconds: number;
}

export interface Savings {
  cost: string;
}

export interface Cost {
  id: string;
  name: string;
  price_cents: number;
}
