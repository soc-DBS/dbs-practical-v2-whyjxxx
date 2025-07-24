const { PrismaClient, Prisma } = require("@prisma/client");
const prisma = new PrismaClient();

module.exports.create = function create(code, name, credit) {
  return prisma.module
    .create({
      //TODO: Add data
      data: {
        modCode: code,
        modName: name,
        creditUnit: parseInt(credit),
      },
    })
    .then(function (module) {
      //TODO: Return module
      return module;
    })
    .catch(function (error) {
      // Prisma error codes: https://www.prisma.io/docs/orm/reference/error-reference#p2002
      // TODO: Handle Prisma Error, throw a new error if module already exists;
      if (error.code === 'P2002') {
        throw new Error('Module already exists.');
      } else {
        throw error;
      }
    });
};

module.exports.updateByCode = function updateByCode(code, credit) {
  return prisma.module
    .update({
      //TODO: Add where and data
      where: {
        modCode: code,
      },
      data: {
        creditUnit: parseInt(credit), 
      },
    })
    .then(function (module) {
      return module;
    })
    .catch(function (error) {
      // Prisma error codes: https://www.prisma.io/docs/orm/reference/error-reference#p2025
      // TODO: Handle Prisma Error, throw a new error if module is not found
      if (error.code === 'P2025') {
        throw new Error('Module not found.');
      } else {
        throw error;
      }
    });
};

module.exports.deleteByCode = function deleteByCode(code) {
  return prisma.module
    .delete({
      //TODO: Add where
      where: {
        modCode: code,
      },
    })
    .then(function (module) {
      // Leave blank
    })
    .catch(function (error) {
      // Prisma error codes: https://www.prisma.io/docs/orm/reference/error-reference#p2025
      // TODO: Handle Prisma Error, throw a new error if module is not found
      if (error.code === 'P2025') {
        throw new Error('Module not found.');
      } else {
        throw error;
      }
    });
};

module.exports.retrieveAll = function retrieveAll() {
  // TODO: Return all modules
  return prisma.module.findMany();
};

module.exports.retrieveByCode = function retrieveByCode(code) {
  // TODO: complete the entire function
  // Prisma error codes: https://www.prisma.io/docs/orm/reference/error-reference#p2025
  // TODO reminder: Handle Prisma Error, throw a new error if module is notfound
  // TODO reminder: Return module at the end
  return prisma.module.findUniqueOrThrow({
      where: {
        modCode: code,
      },
    })
    .then(function (module) {
      return module;
    })
    .catch(function (error) {
      if (error.code === "P2025") {
        throw new Error("Module not found.");
      } else {
        throw error;
      }
    });
};