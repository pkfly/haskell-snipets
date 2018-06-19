{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_testservant (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/sakaitakumi/haskell-snipets/testservant/.stack-work/install/x86_64-osx/lts-11.14/8.2.2/bin"
libdir     = "/Users/sakaitakumi/haskell-snipets/testservant/.stack-work/install/x86_64-osx/lts-11.14/8.2.2/lib/x86_64-osx-ghc-8.2.2/testservant-0.1.0.0-HGcId74EjeqJVXeBhzMzzW-testservant-exe"
dynlibdir  = "/Users/sakaitakumi/haskell-snipets/testservant/.stack-work/install/x86_64-osx/lts-11.14/8.2.2/lib/x86_64-osx-ghc-8.2.2"
datadir    = "/Users/sakaitakumi/haskell-snipets/testservant/.stack-work/install/x86_64-osx/lts-11.14/8.2.2/share/x86_64-osx-ghc-8.2.2/testservant-0.1.0.0"
libexecdir = "/Users/sakaitakumi/haskell-snipets/testservant/.stack-work/install/x86_64-osx/lts-11.14/8.2.2/libexec/x86_64-osx-ghc-8.2.2/testservant-0.1.0.0"
sysconfdir = "/Users/sakaitakumi/haskell-snipets/testservant/.stack-work/install/x86_64-osx/lts-11.14/8.2.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "testservant_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "testservant_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "testservant_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "testservant_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "testservant_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "testservant_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
