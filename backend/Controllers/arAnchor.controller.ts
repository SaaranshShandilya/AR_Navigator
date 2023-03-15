import { Request, Response } from "express";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const uploadARAnchors = async (req: Request, res: Response) => {
  const { arAnchorList } = req.body
  const arLisr = JSON.stringify(arAnchorList);
  // console.log(arAnchorList)
  try {
    const anchorData = await prisma.aRAnchorMatrix.create({
      data: {
        ARAnchorList: arAnchorList,
      },
    });

    return res.json(anchorData)
  } catch (err) {
    console.log(err);
    res.status(500).json({ message: "Internal Server Error" });
  }
};
