#!/bin/sh
# -----------------------------------------------------------------------------
# Start Script for Migrating Hippo CMS Database
#
# Environment Variable Prequisites
#
#   JAVA_HOME       Must point at your Java Development Kit installation.
#
#   JAVA_OPTS       (Optional) Java runtime options used when executed.
#
# -----------------------------------------------------------------------------

JAVA_OPTS="-Xms512m -Xmx1024m"

# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '.*/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

PRGDIR=`dirname "$PRG"`
TOOL_HOME=`cd "$PRGDIR/.." ; pwd`

_LIBPATH=
if [ -d "$TOOL_HOME/lib" ]; then
  for i in "$TOOL_HOME"/lib/*.jar; do
    _LIBPATH="$_LIBPATH":"$i"
  done
fi

CLASSPATH="$CLASSPATH":"$_LIBPATH"

echo "Using JAVA_HOME:       $JAVA_HOME"

java $JAVA_OPTS \
  -classpath "$CLASSPATH" \
  org.apache.jackrabbit.standalone.Main \
  --backup \
  "$@"
