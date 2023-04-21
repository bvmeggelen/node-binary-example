import { upperFirst } from 'lodash';
import { add } from './lib/calc';

// @ts-ignore
console.log(upperFirst('hello from binary -> 1 + 2 = '), add(1, 2));
