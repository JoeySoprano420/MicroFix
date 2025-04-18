// MicroFix Live Debugger UI Template (React w/ Tailwind + ShadCN)
// Supports directive-highlight, real-time execution log, state drilldown

import { useState, useEffect } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Tabs, TabsList, TabsTrigger, TabsContent } from "@/components/ui/tabs";
import { CodeIcon, ActivityIcon, TerminalIcon } from "lucide-react";

const directives = [
  { label: "stream_init", line: 2, highlight: true },
  { label: "guild_directive", line: 17, highlight: false },
  { label: "validate_sensor", line: 39, highlight: false },
];

export default function MicroFixDebugger() {
  const [selected, setSelected] = useState("source");
  const [logs, setLogs] = useState([]);

  useEffect(() => {
    const id = setInterval(() => {
      setLogs((prev) => [
        ...prev.slice(-49),
        `LiveLog#${Date.now() % 10000} > StreamNode event fired`
      ]);
    }, 1200);
    return () => clearInterval(id);
  }, []);

  return (
    <div className="p-4 grid grid-cols-1 md:grid-cols-2 gap-4">
      <Tabs defaultValue="source" className="w-full">
        <TabsList className="mb-4">
          <TabsTrigger value="source" onClick={() => setSelected("source")}> 
            <CodeIcon className="mr-1" /> Source Code
          </TabsTrigger>
          <TabsTrigger value="logs" onClick={() => setSelected("logs")}> 
            <TerminalIcon className="mr-1" /> Live Logs
          </TabsTrigger>
          <TabsTrigger value="runtime" onClick={() => setSelected("runtime")}> 
            <ActivityIcon className="mr-1" /> Runtime State
          </TabsTrigger>
        </TabsList>

        <TabsContent value="source">
          <Card>
            <CardContent className="p-4 bg-gray-900 text-purple-300 font-mono text-sm rounded-xl">
              <pre>
                {directives.map((d, i) => (
                  <div key={i} className={`transition-all ${d.highlight ? 'text-yellow-300' : ''}`}>
                    {`[Line ${d.line}] >> ${d.label}`}
                  </div>
                ))}
              </pre>
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="logs">
          <Card>
            <CardContent className="p-4 bg-black text-green-300 font-mono h-64 overflow-auto">
              {logs.map((log, i) => (
                <div key={i}>{log}</div>
              ))}
            </CardContent>
          </Card>
        </TabsContent>

        <TabsContent value="runtime">
          <Card>
            <CardContent className="p-4 bg-slate-800 text-white">
              <div className="grid grid-cols-2 gap-4">
                <div>
                  <strong>Memory Hooks</strong>
                  <ul className="mt-2 text-sm text-blue-300">
                    <li>L1.cache::prefetch → Online</li>
                    <li>ObjectMind → Syncing...</li>
                    <li>HexRangeMap → Ready</li>
                  </ul>
                </div>
                <div>
                  <strong>Active Threads</strong>
                  <ul className="mt-2 text-sm text-rose-300">
                    <li>GuildRoot@Thread#2</li>
                    <li>StreamNode@Thread#7</li>
                    <li>ProofBuffer@Thread#12</li>
                  </ul>
                </div>
              </div>
            </CardContent>
          </Card>
        </TabsContent>
      </Tabs>

      <div className="hidden md:block">
        <Card>
          <CardContent className="p-4">
            <div className="text-xl font-bold">Execution Controls</div>
            <div className="mt-4 space-x-2">
              <Button>Compile</Button>
              <Button variant="outline">Step</Button>
              <Button variant="destructive">Reset</Button>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
}
