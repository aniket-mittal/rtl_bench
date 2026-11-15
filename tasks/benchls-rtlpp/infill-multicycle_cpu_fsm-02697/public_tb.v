// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 35;
  localparam OW = 135;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02697 dut (
    .clk(clk),
    .Data_in(in_vec[34:3]),
    .INT(in_vec[2:2]),
    .MIO_ready(in_vec[1:1]),
    .reset(in_vec[0:0]),
    .Addr_out(out_vec[134:103]),
    .CPU_MIO(out_vec[102:102]),
    .Data_out(out_vec[101:70]),
    .inst_out(out_vec[69:38]),
    .mem_w(out_vec[37:37]),
    .PC_out(out_vec[36:5]),
    .state(out_vec[4:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 35'h02370779b;
    stim[1] = 35'h0913f0f65;
    stim[2] = 35'h4427f48a2;
    stim[3] = 35'h6bddcbf8e;
    stim[4] = 35'h6da3ce420;
    stim[5] = 35'h28f39bfbe;
    stim[6] = 35'h212f1af5a;
    stim[7] = 35'h02cc18a16;
    stim[8] = 35'h5e0dfaae8;
    stim[9] = 35'h1aa5a7082;
    stim[10] = 35'h7f4e052d0;
    stim[11] = 35'h53af617da;
    stim[12] = 35'h4db6346c4;
    stim[13] = 35'h07d3eef14;
    stim[14] = 35'h1b3bb421c;
    stim[15] = 35'h2495e4b0a;
    stim[16] = 35'h37a9efa0a;
    stim[17] = 35'h20190d32e;
    stim[18] = 35'h2c215ee18;
    stim[19] = 35'h726043410;
    stim[20] = 35'h62b994e10;
    stim[21] = 35'h18cd415d4;
    stim[22] = 35'h3a3192872;
    stim[23] = 35'h1ca400570;
    stim[24] = 35'h23c6e2d0a;
    stim[25] = 35'h6baaf8e24;
    stim[26] = 35'h54d88ef8e;
    stim[27] = 35'h3801e8cda;
    stim[28] = 35'h150a9e036;
    stim[29] = 35'h5637eb59c;
    stim[30] = 35'h53d076cc4;
    stim[31] = 35'h66ecf548a;
    stim[32] = 35'h3b1c854f2;
    stim[33] = 35'h6d45b6766;
    stim[34] = 35'h1abfb6cb2;
    stim[35] = 35'h388d0ea54;
    stim[36] = 35'h1de6fa13e;
    stim[37] = 35'h0b765957e;
    stim[38] = 35'h7f984ab3c;
    stim[39] = 35'h76b299fd0;
    stim[40] = 35'h38fc8c80e;
    stim[41] = 35'h5686bea78;
    stim[42] = 35'h2b788480a;
    stim[43] = 35'h1d3b70094;
    stim[44] = 35'h0b2b6e6f2;
    stim[45] = 35'h633296158;
    stim[46] = 35'h36fb517d2;
    stim[47] = 35'h3606b825e;
    stim[48] = 35'h09a012bec;
    stim[49] = 35'h197c0c8f0;
    stim[50] = 35'h16667e8f8;
    stim[51] = 35'h138bdac26;
    stim[52] = 35'h11f4464b0;
    stim[53] = 35'h5bfffdd3c;
    stim[54] = 35'h6c16faafa;
    stim[55] = 35'h69d9270a8;
    stim[56] = 35'h55ae5b2a0;
    stim[57] = 35'h0ffad7116;
    stim[58] = 35'h5c3c59d54;
    stim[59] = 35'h0f5edc384;
    stim[60] = 35'h5f51e5716;
    stim[61] = 35'h65b9f0e78;
    stim[62] = 35'h039498258;
    stim[63] = 35'h0054ca710;
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
      expv[0] = 135'h0000000000000000011b83bcc000000000;
      expv[1] = 135'h00000000000000000489f87b0000000000;
      expv[2] = 135'h00000000000000002213fa450000000000;
      expv[3] = 135'h000000000000000035eee5fc4000000000;
      expv[4] = 135'h000000000000000036d1e7210000000000;
      expv[5] = 135'h00000000000000001479cdfdc000000000;
      expv[6] = 135'h000000000000000010978d7ac000000000;
      expv[7] = 135'h000000000000000001660c508000000000;
      expv[8] = 135'h00000000000000002f06fd574000000000;
      expv[9] = 135'h00000000000000000d52d3840000000000;
      expv[10] = 135'h00000000000000003fa702968000000000;
      expv[11] = 135'h000000000000000029d7b0bec000000000;
      expv[12] = 135'h000000000000000026db1a360000000000;
      expv[13] = 135'h000000000000000003e9f7788000000000;
      expv[14] = 135'h00000000000000000d9dda10c000000000;
      expv[15] = 135'h0000000000000000124af2584000000000;
      expv[16] = 135'h00000000000000001bd4f7d04000000000;
      expv[17] = 135'h0000000000000000100c86994000000000;
      expv[18] = 135'h00000000000000001610af70c000000000;
      expv[19] = 135'h0000000000000000393021a08000000000;
      expv[20] = 135'h0000000000000000315cca708000000000;
      expv[21] = 135'h00000000000000000c66a0ae8000000000;
      expv[22] = 135'h00000000000000001d18c9438000000000;
      expv[23] = 135'h00000000000000000e52002b8000000000;
      expv[24] = 135'h000000000000000011e371684000000000;
      expv[25] = 135'h000000000000000035d57c710000000000;
      expv[26] = 135'h00000000000000002a6c477c4000000000;
      expv[27] = 135'h00000000000000001c00f466c000000000;
      expv[28] = 135'h00000000000000000a854f018000000000;
      expv[29] = 135'h00000000000000002b1bf5acc000000000;
      expv[30] = 135'h000000000000000029e83b660000000000;
      expv[31] = 135'h000000000000000033767aa44000000000;
      expv[32] = 135'h00000000000000001d8e42a78000000000;
      expv[33] = 135'h000000000000000036a2db3b0000000000;
      expv[34] = 135'h00000000000000000d5fdb658000000000;
      expv[35] = 135'h00000000000000001c4687528000000000;
      expv[36] = 135'h00000000000000000ef37d09c000000000;
      expv[37] = 135'h000000000000000005bb2cabc000000000;
      expv[38] = 135'h00000000000000003fcc2559c000000000;
      expv[39] = 135'h00000000000000003b594cfe8000000000;
      expv[40] = 135'h00000000000000001c7e46404000000000;
      expv[41] = 135'h00000000000000002b435f53c000000000;
      expv[42] = 135'h000000000000000015bc42404000000000;
      expv[43] = 135'h00000000000000000e9db8048000000000;
      expv[44] = 135'h00000000000000000595b7378000000000;
      expv[45] = 135'h000000000000000031994b0ac000000000;
      expv[46] = 135'h00000000000000001b7da8be8000000000;
      expv[47] = 135'h00000000000000001b035c12c000000000;
      expv[48] = 135'h000000000000000004d0095f4000000000;
      expv[49] = 135'h00000000000000000cbe06478000000000;
      expv[50] = 135'h00000000000000000b333f47c000000000;
      expv[51] = 135'h000000000000000009c5ed610000000000;
      expv[52] = 135'h000000000000000008fa23258000000000;
      expv[53] = 135'h00000000000000002dfffee9c000000000;
      expv[54] = 135'h0000000000000000360b7d57c000000000;
      expv[55] = 135'h000000000000000034ec93854000000000;
      expv[56] = 135'h00000000000000002ad72d950000000000;
      expv[57] = 135'h000000000000000007fd6b888000000000;
      expv[58] = 135'h00000000000000002e1e2cea8000000000;
      expv[59] = 135'h000000000000000007af6e1c0000000000;
      expv[60] = 135'h00000000000000002fa8f2b88000000000;
      expv[61] = 135'h000000000000000032dcf873c000000000;
      expv[62] = 135'h000000000000000001ca4c12c000000000;
      expv[63] = 135'h0000000000000000002a65388000000000;
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
