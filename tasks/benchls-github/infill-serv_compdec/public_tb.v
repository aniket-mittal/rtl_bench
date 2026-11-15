// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 33;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  serv_compdec dut (
    .i_clk(clk),
    .i_instr(in_vec[32:1]),
    .i_ack(in_vec[0:0]),
    .o_instr(out_vec[32:1]),
    .o_iscomp(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 33'h1278c722a;
    stim[1] = 33'h198375712;
    stim[2] = 33'h17dae6d16;
    stim[3] = 33'h1176bd98d;
    stim[4] = 33'h00a51ee64;
    stim[5] = 33'h1ce6bf98e;
    stim[6] = 33'h10a118a7c;
    stim[7] = 33'h02f6b352e;
    stim[8] = 33'h0c91f7dc7;
    stim[9] = 33'h1c1e44844;
    stim[10] = 33'h1ef2d28f0;
    stim[11] = 33'h01cf16439;
    stim[12] = 33'h04ac55c67;
    stim[13] = 33'h051a46fb7;
    stim[14] = 33'h10a885880;
    stim[15] = 33'h0874c82b8;
    stim[16] = 33'h16cee94c4;
    stim[17] = 33'h0717fddf8;
    stim[18] = 33'h112013bf8;
    stim[19] = 33'h03e05f487;
    stim[20] = 33'h01840dc79;
    stim[21] = 33'h19b0cea3f;
    stim[22] = 33'h170983b2f;
    stim[23] = 33'h1bb4b5552;
    stim[24] = 33'h03e1c7729;
    stim[25] = 33'h0aabbfdca;
    stim[26] = 33'h0ae7c9556;
    stim[27] = 33'h0085d924a;
    stim[28] = 33'h0b36c1a0b;
    stim[29] = 33'h19110be31;
    stim[30] = 33'h02e8636ec;
    stim[31] = 33'h0cef2c0c3;
    stim[32] = 33'h05ed9accc;
    stim[33] = 33'h1b2ee7275;
    stim[34] = 33'h1d89f291b;
    stim[35] = 33'h152e0a8ef;
    stim[36] = 33'h115975919;
    stim[37] = 33'h1ad174f5e;
    stim[38] = 33'h16cef2100;
    stim[39] = 33'h1fe745c5f;
    stim[40] = 33'h104055dec;
    stim[41] = 33'h02b26b3c0;
    stim[42] = 33'h051792494;
    stim[43] = 33'h0f9d5b807;
    stim[44] = 33'h184279524;
    stim[45] = 33'h00d299576;
    stim[46] = 33'h0a62bdd7a;
    stim[47] = 33'h059fdd27c;
    stim[48] = 33'h0f30408ea;
    stim[49] = 33'h0b00f1d44;
    stim[50] = 33'h1f266aab8;
    stim[51] = 33'h1e0d5f287;
    stim[52] = 33'h147ba446a;
    stim[53] = 33'h00da70c80;
    stim[54] = 33'h1a2ddec6d;
    stim[55] = 33'h06a67eca6;
    stim[56] = 33'h094da6ecf;
    stim[57] = 33'h01d451302;
    stim[58] = 33'h1a53e84f0;
    stim[59] = 33'h17ad5cfce;
    stim[60] = 33'h01b23b7f0;
    stim[61] = 33'h1613a9a97;
    stim[62] = 33'h123fb02df;
    stim[63] = 33'h06df65cf5;
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
      expv[0] = 33'h186bfe1dx;
      expv[1] = 33'h0aa4000dx;
      expv[2] = 33'h17dae6d1x;
      expv[3] = 33'h00a22584x;
      expv[4] = 33'h015824c47;
      expv[5] = 33'h1ce6bf98f;
      expv[6] = 33'h011e24847;
      expv[7] = 33'h02f6b352f;
      expv[8] = 33'h0c91f7dc7;
      expv[9] = 33'h001082826;
      expv[10] = 33'h1ef2d28f0;
      expv[11] = 33'h01cf16438;
      expv[12] = 33'h04ac55c66;
      expv[13] = 33'h051a46fb6;
      expv[14] = 33'h042820826;
      expv[15] = 33'h0008a4f06;
      expv[16] = 33'h003025406;
      expv[17] = 33'h009ed5c46;
      expv[18] = 33'h112013bf8;
      expv[19] = 33'h03e05f486;
      expv[20] = 33'h00b0c4f06;
      expv[21] = 33'h19b0cea3f;
      expv[22] = 33'h170983b2e;
      expv[23] = 33'h02b4000de;
      expv[24] = 33'h03e020d26;
      expv[25] = 33'h1fc0d39c7;
      expv[26] = 33'h0ae7c9557;
      expv[27] = 33'h00c0a10c7;
      expv[28] = 33'h0003a1a27;
      expv[29] = 33'h0070e4e07;
      expv[30] = 33'h003b63627;
      expv[31] = 33'h00003006f;
      expv[32] = 33'h007224c47;
      expv[33] = 33'h001d23227;
      expv[34] = 33'h08069a927;
      expv[35] = 33'h152e0a8ef;
      expv[36] = 33'h115975918;
      expv[37] = 33'h1ad174f5e;
      expv[38] = 33'h16cef2100;
      expv[39] = 33'h1fe745c5e;
      expv[40] = 33'h003a01d66;
      expv[41] = 33'h00e8b4806;
      expv[42] = 33'h002440466;
      expv[43] = 33'h0f9d5b806;
      expv[44] = 33'h008825446;
      expv[45] = 33'h00d299576;
      expv[46] = 33'h00c0d3ec6;
      expv[47] = 33'h011e25046;
      expv[48] = 33'h003a80826;
      expv[49] = 33'h001001d66;
      expv[50] = 33'h0058a4f06;
      expv[51] = 33'h1e0d5f286;
      expv[52] = 33'h0258001de;
      expv[53] = 33'h00da70c80;
      expv[54] = 33'h005a24c46;
      expv[55] = 33'h06a67eca7;
      expv[56] = 33'h094da6ecf;
      expv[57] = 33'h0000beb26;
      expv[58] = 33'h0088c4e06;
      expv[59] = 33'h17ad5cfce;
      expv[60] = 33'h00dcf5446;
      expv[61] = 33'h1613a9a96;
      expv[62] = 33'h123fb02de;
      expv[63] = 33'h003dc3c26;
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
