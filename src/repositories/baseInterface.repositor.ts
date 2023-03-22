export interface BaseRepositoryInterface<T> {
  setModel(model) : any;
  getModelName() : string;
  make(withs: string[]);
  all(columns: string[], relations: string[]);
  allBy(condition: [], relations: [], columns: string[]);
  getListPaginateBy(condition: string[], relations: string[], columns: string[], paginate: number);
  getFirstBy(condition: string[], columns: string[], relations: string[]);
  firstOrCreate(data: any, withs: string[]);
  findById(id: string, columns: string[], relations: string[], append: string[]);
  pluck(column: string[], key: any, condition: string[]);
  create(payload: any);
  createOrUpdate(data: any, condition: string[]);
  updateById(id: string, payload: any);
  update(condition: string[], data: any);
  delete(model: any);
  deleteById(id: string);
  deleteBy(condition: string[]);
  count(condition: string[]);
  getByWhereIn(column: string[], value: [], args: []);
  insert(data: any);
}