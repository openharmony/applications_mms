/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import LooseObject from '../data/LooseObject';

export default class BaseModel {
  public encapsulateReturnResult(code, abilityResult): LooseObject {
    let result: LooseObject = {};
    result.code = code;
    result.abilityResult = abilityResult;
    return result;
  }

  public encapsulateReturnCode(code): LooseObject {
    let result: LooseObject = {};
    result.code = code;
    return result;
  }
}