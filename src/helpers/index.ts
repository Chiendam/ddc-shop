import slugify from "slugify";

export const createSlug = (title: string): string => {
  return slugify(title, {
    lower: true,  // chuyển toàn bộ ký tự thành chữ thường
    remove: /[*+~.()'"!:@]/g, // loại bỏ các ký tự đặc biệt
    strict: true, // loại bỏ các ký tự không hợp lệ
  });
}