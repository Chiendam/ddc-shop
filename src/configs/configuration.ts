export enum SLUGABLE_TYPE {
  CATEGROY = 'CATEGORY',
  PRODUCT = 'PRODUCT',
  POST = 'POST'
}

export default () => ({
  SLUGABLE_TYPE: SLUGABLE_TYPE
  // DATABASE: {
  //   host: process.env.DATABASE_HOST,
  //   port: parseInt(process.env.DATABASE_PORT, 10) || 5432
  // }
});