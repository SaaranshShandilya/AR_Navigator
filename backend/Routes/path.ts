import { Router } from 'express'
import { uploadARAnchors } from '../Controllers/arAnchor.controller';

const router = Router();

router.post("/uploadPath", uploadARAnchors)

export default router;