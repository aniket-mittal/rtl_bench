// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 32;
  localparam OW = 32;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_00843 dut (
    .clk(clk),
    .a0(in_vec[31:24]),
    .b0(in_vec[23:16]),
    .a1(in_vec[15:8]),
    .b1(in_vec[7:0]),
    .z0(out_vec[31:16]),
    .z1(out_vec[15:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 32'h74f57d38;
    stim[1] = 32'hb176d91d;
    stim[2] = 32'he6eba776;
    stim[3] = 32'h266e0de9;
    stim[4] = 32'h6f2ed5bc;
    stim[5] = 32'hb19701cb;
    stim[6] = 32'h443f16ea;
    stim[7] = 32'hcdb091bb;
    stim[8] = 32'h6c5831cd;
    stim[9] = 32'h3a658748;
    stim[10] = 32'h71990384;
    stim[11] = 32'hf1331036;
    stim[12] = 32'h16cce3ef;
    stim[13] = 32'hcf3f674c;
    stim[14] = 32'hedb42a8f;
    stim[15] = 32'h6afb6992;
    stim[16] = 32'h81fcc6d3;
    stim[17] = 32'h672972ed;
    stim[18] = 32'hb53fbc4c;
    stim[19] = 32'h4881310e;
    stim[20] = 32'h4ddabfbd;
    stim[21] = 32'h8c4446e7;
    stim[22] = 32'hb8d69d40;
    stim[23] = 32'h22d709ec;
    stim[24] = 32'hc8d2a0b3;
    stim[25] = 32'ha2796d2f;
    stim[26] = 32'h57efc8e4;
    stim[27] = 32'h54bd9227;
    stim[28] = 32'h3b6b748a;
    stim[29] = 32'h5140cdab;
    stim[30] = 32'hd1b13ca6;
    stim[31] = 32'hacdf6914;
    stim[32] = 32'h31441441;
    stim[33] = 32'hd499dc43;
    stim[34] = 32'h6a03ceab;
    stim[35] = 32'h17b659a7;
    stim[36] = 32'h3e9e1937;
    stim[37] = 32'hac80f34d;
    stim[38] = 32'h370f582c;
    stim[39] = 32'hf284c87c;
    stim[40] = 32'hef739355;
    stim[41] = 32'hfe73ae3b;
    stim[42] = 32'h469c33c7;
    stim[43] = 32'he0b73e8e;
    stim[44] = 32'h191ba6a8;
    stim[45] = 32'h5ee5539c;
    stim[46] = 32'h239269bb;
    stim[47] = 32'h29725173;
    stim[48] = 32'h5060d735;
    stim[49] = 32'hd1c86c71;
    stim[50] = 32'habdc13d5;
    stim[51] = 32'ha0af1a4d;
    stim[52] = 32'h5aada6a7;
    stim[53] = 32'h790ec965;
    stim[54] = 32'h36337266;
    stim[55] = 32'h954cfa95;
    stim[56] = 32'h0816ba79;
    stim[57] = 32'h5c3abba6;
    stim[58] = 32'h874a95e4;
    stim[59] = 32'h9569e427;
    stim[60] = 32'h219f14fd;
    stim[61] = 32'h9ad80522;
    stim[62] = 32'h34fcd2ad;
    stim[63] = 32'he435f143;
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
      expv[0] = 32'hxxxxxxxx;
      expv[1] = 32'h6f041b58;
      expv[2] = 32'h51961895;
      expv[3] = 32'hd3224cfa;
      expv[4] = 32'h10540bd5;
      expv[5] = 32'h13f29c6c;
      expv[6] = 32'h686700cb;
      expv[7] = 32'h10bc141c;
      expv[8] = 32'h8cf069eb;
      expv[9] = 32'h2520273d;
      expv[10] = 32'h16e225f8;
      expv[11] = 32'h4389018c;
      expv[12] = 32'h30030360;
      expv[13] = 32'h1188d3ed;
      expv[14] = 32'h32f11e94;
      expv[15] = 32'ha6a41776;
      expv[16] = 32'h67ee3be2;
      expv[17] = 32'h7efca332;
      expv[18] = 32'h107f698a;
      expv[19] = 32'h2c8b37d0;
      expv[20] = 32'h244802ae;
      expv[21] = 32'h41928d03;
      expv[22] = 32'h25303f2a;
      expv[23] = 32'h99d02740;
      expv[24] = 32'h1c8e084c;
      expv[25] = 32'ha4106fe0;
      expv[26] = 32'h4c921403;
      expv[27] = 32'h5139b220;
      expv[28] = 32'h3e04163e;
      expv[29] = 32'h18a93e88;
      expv[30] = 32'h144088ef;
      expv[31] = 32'h908126e8;
      expv[32] = 32'h95d40834;
      expv[33] = 32'h0d040514;
      expv[34] = 32'h7eb43994;
      expv[35] = 32'h013e899a;
      expv[36] = 32'h105a3a0f;
      expv[37] = 32'h2644055f;
      expv[38] = 32'h56004917;
      expv[39] = 32'h03390f20;
      expv[40] = 32'h7cc860e0;
      expv[41] = 32'h6b5d30cf;
      expv[42] = 32'h721a281a;
      expv[43] = 32'h2aa827a5;
      expv[44] = 32'ha0202264;
      expv[45] = 32'h02a36cf0;
      expv[46] = 32'h54163294;
      expv[47] = 32'h13f64cb3;
      expv[48] = 32'h12422463;
      expv[49] = 32'h1e002c83;
      expv[50] = 32'ha3482fac;
      expv[51] = 32'h92f40fcf;
      expv[52] = 32'h6d6007d2;
      expv[53] = 32'h3cd26c4a;
      expv[54] = 32'h069e4f4d;
      expv[55] = 32'h0ac22d6c;
      expv[56] = 32'h2c3c9182;
      expv[57] = 32'h00b057ea;
      expv[58] = 32'h14d87942;
      expv[59] = 32'h270684b4;
      expv[60] = 32'h3d1d22bc;
      expv[61] = 32'h147f13c4;
      expv[62] = 32'h81f000aa;
      expv[63] = 32'h33308dea;
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
