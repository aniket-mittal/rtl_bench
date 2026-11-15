// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 28;
  localparam OW = 48;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_09035 dut (
    .clk(clk),
    .AddrC(in_vec[27:25]),
    .AddrA(in_vec[24:22]),
    .AddrB(in_vec[21:19]),
    .DIH(in_vec[18:11]),
    .DIL(in_vec[10:3]),
    .CEN(in_vec[2:2]),
    .WEH(in_vec[1:1]),
    .WEL(in_vec[0:0]),
    .DOBH(out_vec[47:40]),
    .DOAL(out_vec[39:32]),
    .DOCL(out_vec[31:24]),
    .DOBL(out_vec[23:16]),
    .DOCH(out_vec[15:8]),
    .DOAH(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 28'h488db4f;
    stim[1] = 28'h0504c79;
    stim[2] = 28'hf36a623;
    stim[3] = 28'h9d6ca97;
    stim[4] = 28'h63c6eb6;
    stim[5] = 28'h50cf21f;
    stim[6] = 28'h775229b;
    stim[7] = 28'hb0d81ae;
    stim[8] = 28'hc1f2487;
    stim[9] = 28'h18d68ca;
    stim[10] = 28'h2aa48ab;
    stim[11] = 28'h7b62b3c;
    stim[12] = 28'h764b6cf;
    stim[13] = 28'h5fb1e3d;
    stim[14] = 28'h8a695c4;
    stim[15] = 28'hf367d9c;
    stim[16] = 28'hbd471fb;
    stim[17] = 28'h00d39a5;
    stim[18] = 28'ha15ac57;
    stim[19] = 28'h8f9bb36;
    stim[20] = 28'h1fc3baf;
    stim[21] = 28'h07a5e83;
    stim[22] = 28'h82a7169;
    stim[23] = 28'hf1e1ba8;
    stim[24] = 28'h7f04a7d;
    stim[25] = 28'hc982c8e;
    stim[26] = 28'h3f2cf3c;
    stim[27] = 28'hef43357;
    stim[28] = 28'hbc0dec7;
    stim[29] = 28'hebcca1b;
    stim[30] = 28'h87536bd;
    stim[31] = 28'hd2aa43b;
    stim[32] = 28'h80c10c7;
    stim[33] = 28'ha795c57;
    stim[34] = 28'he6782da;
    stim[35] = 28'h687df50;
    stim[36] = 28'hf64ba8d;
    stim[37] = 28'h9fc6ffe;
    stim[38] = 28'ha5bda42;
    stim[39] = 28'h6639fc9;
    stim[40] = 28'hc3fa4ec;
    stim[41] = 28'hb28e874;
    stim[42] = 28'hafce5fd;
    stim[43] = 28'h8b52e5d;
    stim[44] = 28'hc88808e;
    stim[45] = 28'hb563cc4;
    stim[46] = 28'h4c73360;
    stim[47] = 28'hf6e83d4;
    stim[48] = 28'ha1face0;
    stim[49] = 28'h612b718;
    stim[50] = 28'h469bf9e;
    stim[51] = 28'h08e4ee0;
    stim[52] = 28'h9420eb8;
    stim[53] = 28'h15b4a81;
    stim[54] = 28'h48dbbfc;
    stim[55] = 28'h0f93f60;
    stim[56] = 28'hc9be8fe;
    stim[57] = 28'h15d875e;
    stim[58] = 28'hd9bc063;
    stim[59] = 28'h1ecf7eb;
    stim[60] = 28'he91274f;
    stim[61] = 28'h100e8a4;
    stim[62] = 28'he97ca55;
    stim[63] = 28'h23edc68;
    for (c = 0; c < N; c = c + 1) begin
      #1 in_vec = stim[c];
      #3 sample;
      #1 clk = 1'b1;
      #5 clk = 1'b0;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 48'hxxxxxxxxxxxx;
      expv[1] = 48'h1bxxxx69xxxx;
      expv[2] = 48'hxxxxxxxxxxxx;
      expv[3] = 48'h1bxxxx69xxxx;
      expv[4] = 48'hd9xxxx52xxxx;
      expv[5] = 48'hxxxx69xx1bxx;
      expv[6] = 48'hxxxxxxxxxxxx;
      expv[7] = 48'hxx43xxxxxx9e;
      expv[8] = 48'hxxxxxxxxxx8d;
      expv[9] = 48'hxxxx90xxe4xx;
      expv[10] = 48'hxx69xxxxxx1b;
      expv[11] = 48'hxxxxxxxxxxxx;
      expv[12] = 48'hb0xxxx43xxxx;
      expv[13] = 48'hd95269521bd9;
      expv[14] = 48'hb0694343b01b;
      expv[15] = 48'hxx43c7xxd9b0;
      expv[16] = 48'h1bc7d96996d9;
      expv[17] = 48'hxx9090xxe4e4;
      expv[18] = 48'h1b34d96996e4;
      expv[19] = 48'hd9xx43c7b0xx;
      expv[20] = 48'hd9c78ac7b5d9;
      expv[21] = 48'h87xx8a75b5xx;
      expv[22] = 48'h968a43d9b0b5;
      expv[23] = 48'h374375xx87b0;
      expv[24] = 48'hxx75xxxx3787;
      expv[25] = 48'h3769xxxxxx1b;
      expv[26] = 48'hxx4fxxxxxx87;
      expv[27] = 48'hxxxx4fxx8737;
      expv[28] = 48'hb54fd98a9687;
      expv[29] = 48'h1b69d8d81b05;
      expv[30] = 48'hxxxx43xxb0xx;
      expv[31] = 48'h9643xxd9xxb0;
      expv[32] = 48'hxx8a43d7b0b5;
      expv[33] = 48'h1bd7d9d896xx;
      expv[34] = 48'hb08ad8431b2b;
      expv[35] = 48'h82696a188605;
      expv[36] = 48'hb0d9d8431b96;
      expv[37] = 48'h1bd843d8b01b;
      expv[38] = 48'h868a516a962b;
      expv[39] = 48'hb08a6a43862b;
      expv[40] = 48'h8d18xxd8xx82;
      expv[41] = 48'h9643515196b0;
      expv[42] = 48'h8d6a51d89686;
      expv[43] = 48'hxx6943xxb005;
      expv[44] = 48'h2bcbxx8axx05;
      expv[45] = 48'h105151cb9696;
      expv[46] = 48'h82bfcb181086;
      expv[47] = 48'h9651d8518d96;
      expv[48] = 48'h861851bf9682;
      expv[49] = 48'h1018bfcb8682;
      expv[50] = 48'h968acb51102b;
      expv[51] = 48'h37cb188a8210;
      expv[52] = 48'h82514318b096;
      expv[53] = 48'h865118bf8296;
      expv[54] = 48'h37cbcb8a1010;
      expv[55] = 48'h8dbf18d88286;
      expv[56] = 48'h86cbxxbfxx10;
      expv[57] = 48'h865118bf8296;
      expv[58] = 48'h86xxxxbfxxxx;
      expv[59] = 48'hb0d81851828d;
      expv[60] = 48'h7dcbd8cb8d7d;
      expv[61] = 48'h8243181882b0;
      expv[62] = 48'h24e9d8e98d24;
      expv[63] = 48'h8d188ad83782;
      mismatches = 0;
      shown = 0;
      for (c = 0; c < N; c = c + 1) begin
        bad = 0;
        for (b = 0; b < OW; b = b + 1)
          if (expv[c][b] !== 1'bx && act[c][b] !== expv[c][b]) bad = 1;
        if (bad) begin
          mismatches = mismatches + 1;
          if (shown < 10) begin
            $display("MISMATCH cycle %0d: inputs=%h expected=%h got=%h", c, stim[c], expv[c], act[c]);
            shown = shown + 1;
          end
        end
      end
      if (mismatches == 0) $display("PASS %0d/%0d cycles", N, N);
      else $display("FAIL %0d/%0d cycles mismatched", mismatches, N);
    end
    $finish;
  end
endmodule
