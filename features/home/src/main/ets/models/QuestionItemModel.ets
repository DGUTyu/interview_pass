export interface QuestionItem {
  id: string;
  /* 题干 */
  stem: string;
  /* 难度 */
  difficulty: number;
  /* 点赞数 */
  likeCount: number;
  /* 浏览数 */
  views: number;
  /* 是否已看 */
  readFlag: 0 | 1;
}

export class QuestionItemModel implements QuestionItem {
  id: string = ''
  stem: string = ''
  difficulty: number = 0
  likeCount: number = 0
  views: number = 0
  readFlag: 0 | 1 = 0

  constructor(model: QuestionItem) {
    this.id = model.id
    this.stem = model.stem
    this.difficulty = model.difficulty
    this.likeCount = model.likeCount
    this.views = model.views
    this.readFlag = model.readFlag
  }
}