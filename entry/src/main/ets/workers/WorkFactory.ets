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

import { ThreadWorkerGlobalScope, MessageEvents } from '@ohos.worker';
import DataWorkerWrapper, { DataWorkerTask } from './DataWorkerWrapper'
import WorkerWrapper, { WorkerMessage } from './base/WorkerWrapper'
import WorkerTask from './base/WorkerTask'
import HiLog from '../utils/HiLog';

const TAG = 'WorkFactory'

export enum WorkerType {
  DataWorker,
}

export default class WorkFactory {
  /**
   * Get the Task for worker
   *
   * @param workerPort ThreadWorkerGlobalScope
   * @param message worker message data
   * @return WorkerTask for the message
   */
  static getTask(workerPort: ThreadWorkerGlobalScope, message: MessageEvents): WorkerTask {
    let data = <WorkerMessage> message.data;
    let type = data.type;
    HiLog.i(TAG, `getTask in ${WorkerType[type]}.`)
    let task: WorkerTask = null;
    if (type == WorkerType.DataWorker) {
      HiLog.w(TAG, 'getTask ' + type);
      task = DataWorkerTask.getInstance(workerPort);
    }
    HiLog.w(TAG, 'getTask end')
    return task;
  }

  /**
   * Get the Worker Wrapper obj
   *
   * @param type WorkerType
   * @return WorkerWrapper for the WorkerType
   */
  static getWorker(type: WorkerType): WorkerWrapper {
    HiLog.i(TAG, `getWorker in ${WorkerType[type]}.`)
    let worker: WorkerWrapper = null;
    if (type == WorkerType.DataWorker) {
      HiLog.w(TAG, 'getWorker ' + type)
      worker = DataWorkerWrapper.getInstance();
    }
    HiLog.w(TAG, 'getWorker end')
    return worker;
  }
}