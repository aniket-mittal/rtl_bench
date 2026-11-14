// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 68;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .clk(clk),
    .load(in_vec[67:67]),
    .ena(in_vec[66:66]),
    .amount(in_vec[65:64]),
    .data(in_vec[63:0]),
    .q(out_vec[63:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 68'h13a1e63888b453290;
    stim[1] = 68'h3eef3d562be50154f;
    stim[2] = 68'hf4ff4e53683b4b9db;
    stim[3] = 68'hc25e81fab055cf899;
    stim[4] = 68'hf45d3ea12af92e8da;
    stim[5] = 68'h50c2f8cdc3f0e4b4b;
    stim[6] = 68'h6bdc996331f0af155;
    stim[7] = 68'hc00777f2f37a8c018;
    stim[8] = 68'h303a91ef4b07c32a0;
    stim[9] = 68'h9af678c5687e2d14e;
    stim[10] = 68'h1a73da3a648493de7;
    stim[11] = 68'hd3833166c2c36ad99;
    stim[12] = 68'habe10d0a51d000753;
    stim[13] = 68'h1d92850585d39dcb7;
    stim[14] = 68'h1f19917385533bad6;
    stim[15] = 68'hb338e60db061fbee3;
    stim[16] = 68'hed1c6a376623c80c1;
    stim[17] = 68'hf0a1d08d9076087e5;
    stim[18] = 68'hd7e60f81c87cbc261;
    stim[19] = 68'hc63ceb84c8683872f;
    stim[20] = 68'h97e78d3f0fd824b3f;
    stim[21] = 68'h76377eff4a677b8ee;
    stim[22] = 68'h6d77b50cdaa97b0e3;
    stim[23] = 68'he0fb322642e9716a3;
    stim[24] = 68'h29231c7e66209a4cf;
    stim[25] = 68'h99202b31763cd626e;
    stim[26] = 68'h1112275dbcbdf7891;
    stim[27] = 68'hf7c47d478626e3dff;
    stim[28] = 68'h517401b9038a3eb4f;
    stim[29] = 68'heb11fce00273c296f;
    stim[30] = 68'hcb544dcaafeeab942;
    stim[31] = 68'hdd3c8b601e327b3b7;
    stim[32] = 68'h6e76d84a94801a6c8;
    stim[33] = 68'hc11b11574b49cf165;
    stim[34] = 68'h40e4188ae0007e2c3;
    stim[35] = 68'hc84456ee951dc911e;
    stim[36] = 68'h394e1e3c7971ca045;
    stim[37] = 68'h62a7b6903a7e41172;
    stim[38] = 68'he660d5b4676f06c7b;
    stim[39] = 68'h2df962ac4d181a33d;
    stim[40] = 68'h3c0fbceed4d21682c;
    stim[41] = 68'h114ea2555e39d1c1b;
    stim[42] = 68'h64875eb9ec34b61f6;
    stim[43] = 68'hc2e02f28fca96b0da;
    stim[44] = 68'hebaf86d2086ebe9df;
    stim[45] = 68'h2b451aac2951c4c0b;
    stim[46] = 68'h7b2d506fbe3768a9b;
    stim[47] = 68'h619b7ef36b1546f88;
    stim[48] = 68'hac92bc65e5ec02919;
    stim[49] = 68'h6c2425a62cdb48041;
    stim[50] = 68'hdaf0beda316d9c861;
    stim[51] = 68'hbddc4b1e218a02401;
    stim[52] = 68'ha25d73f96f8cad49e;
    stim[53] = 68'h15398334b1d5e2ff9;
    stim[54] = 68'h3ccce6b6bd5180bdc;
    stim[55] = 68'h2c6f70023133c56d9;
    stim[56] = 68'h9c9eb86e4ef4d1d27;
    stim[57] = 68'h91bb66e7ff78e4448;
    stim[58] = 68'h34c97d80dc28ee1b7;
    stim[59] = 68'h96e5de5cb4dddbb4f;
    stim[60] = 68'h337ed496bb52a5f0d;
    stim[61] = 68'h63717365566afe6ab;
    stim[62] = 68'h00a2a74694f1e63cd;
    stim[63] = 68'hd823685b287072e15;
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
      expv[0] = 64'hxxxxxxxxxxxxxxxx;
      expv[1] = 64'hxxxxxxxxxxxxxxxx;
      expv[2] = 64'hxxxxxxxxxxxxxxxx;
      expv[3] = 64'h4ff4e53683b4b9db;
      expv[4] = 64'h25e81fab055cf899;
      expv[5] = 64'h45d3ea12af92e8da;
      expv[6] = 64'hd3ea12af92e8da00;
      expv[7] = 64'h69f50957c9746d00;
      expv[8] = 64'h00777f2f37a8c018;
      expv[9] = 64'h00777f2f37a8c018;
      expv[10] = 64'haf678c5687e2d14e;
      expv[11] = 64'haf678c5687e2d14e;
      expv[12] = 64'h3833166c2c36ad99;
      expv[13] = 64'hbe10d0a51d000753;
      expv[14] = 64'hbe10d0a51d000753;
      expv[15] = 64'hbe10d0a51d000753;
      expv[16] = 64'h338e60db061fbee3;
      expv[17] = 64'hd1c6a376623c80c1;
      expv[18] = 64'h0a1d08d9076087e5;
      expv[19] = 64'h7e60f81c87cbc261;
      expv[20] = 64'h63ceb84c8683872f;
      expv[21] = 64'h7e78d3f0fd824b3f;
      expv[22] = 64'h007e78d3f0fd824b;
      expv[23] = 64'h003f3c69f87ec125;
      expv[24] = 64'h0fb322642e9716a3;
      expv[25] = 64'h0fb322642e9716a3;
      expv[26] = 64'h9202b31763cd626e;
      expv[27] = 64'h9202b31763cd626e;
      expv[28] = 64'h7c47d478626e3dff;
      expv[29] = 64'h47d478626e3dff00;
      expv[30] = 64'hb11fce00273c296f;
      expv[31] = 64'hb544dcaafeeab942;
      expv[32] = 64'hd3c8b601e327b3b7;
      expv[33] = 64'h69e45b00f193d9db;
      expv[34] = 64'h11b11574b49cf165;
      expv[35] = 64'h23622ae96939e2ca;
      expv[36] = 64'h84456ee951dc911e;
      expv[37] = 64'h84456ee951dc911e;
      expv[38] = 64'h4222b774a8ee488f;
      expv[39] = 64'h660d5b4676f06c7b;
      expv[40] = 64'h660d5b4676f06c7b;
      expv[41] = 64'h660d5b4676f06c7b;
      expv[42] = 64'h660d5b4676f06c7b;
      expv[43] = 64'h3306ada33b78363d;
      expv[44] = 64'h2e02f28fca96b0da;
      expv[45] = 64'hbaf86d2086ebe9df;
      expv[46] = 64'hbaf86d2086ebe9df;
      expv[47] = 64'hffbaf86d2086ebe9;
      expv[48] = 64'h7fdd7c36904375f4;
      expv[49] = 64'hc92bc65e5ec02919;
      expv[50] = 64'h6495e32f2f60148c;
      expv[51] = 64'haf0beda316d9c861;
      expv[52] = 64'hddc4b1e218a02401;
      expv[53] = 64'h25d73f96f8cad49e;
      expv[54] = 64'h25d73f96f8cad49e;
      expv[55] = 64'h25d73f96f8cad49e;
      expv[56] = 64'h25d73f96f8cad49e;
      expv[57] = 64'hc9eb86e4ef4d1d27;
      expv[58] = 64'h1bb66e7ff78e4448;
      expv[59] = 64'h1bb66e7ff78e4448;
      expv[60] = 64'h6e5de5cb4dddbb4f;
      expv[61] = 64'h6e5de5cb4dddbb4f;
      expv[62] = 64'h372ef2e5a6eedda7;
      expv[63] = 64'h372ef2e5a6eedda7;
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
