// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 31;
  localparam OW = 36;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_02066 dut (
    .clk(clk),
    .rstn(in_vec[30:30]),
    .tic_enable(in_vec[29:29]),
    .f_control(in_vec[28:0]),
    .carrier_val(out_vec[35:4]),
    .i_sign(out_vec[3:3]),
    .i_mag(out_vec[2:2]),
    .q_sign(out_vec[1:1]),
    .q_mag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 31'h190ffda1;
    stim[1] = 31'h2097ce79;
    stim[2] = 31'h4e476b54;
    stim[3] = 31'h6c3585c4;
    stim[4] = 31'h480b3ccc;
    stim[5] = 31'h486ab23f;
    stim[6] = 31'h4ff79d97;
    stim[7] = 31'h7d9278ff;
    stim[8] = 31'h6e9a571f;
    stim[9] = 31'h4a70a591;
    stim[10] = 31'h44f6c761;
    stim[11] = 31'h775f35fd;
    stim[12] = 31'h5e679c45;
    stim[13] = 31'h7275d89b;
    stim[14] = 31'h607b8c98;
    stim[15] = 31'h713e95b2;
    stim[16] = 31'h45252a85;
    stim[17] = 31'h6febab3f;
    stim[18] = 31'h792e57c4;
    stim[19] = 31'h6ee5edf7;
    stim[20] = 31'h4669b197;
    stim[21] = 31'h6a7d1fc8;
    stim[22] = 31'h5f4ce9fe;
    stim[23] = 31'h70a7c2c4;
    stim[24] = 31'h611c4f80;
    stim[25] = 31'h4843a83e;
    stim[26] = 31'h4cb3a8fc;
    stim[27] = 31'h65ea0bc4;
    stim[28] = 31'h6c037f48;
    stim[29] = 31'h6523ee86;
    stim[30] = 31'h70738d15;
    stim[31] = 31'h49f82c6c;
    stim[32] = 31'h4bec3890;
    stim[33] = 31'h7b733eec;
    stim[34] = 31'h5e854f31;
    stim[35] = 31'h70b5dc79;
    stim[36] = 31'h4eaf9ec7;
    stim[37] = 31'h62e77fdf;
    stim[38] = 31'h66d49170;
    stim[39] = 31'h760c29d0;
    stim[40] = 31'h79896bee;
    stim[41] = 31'h6579ce2a;
    stim[42] = 31'h5d680b18;
    stim[43] = 31'h62fb2364;
    stim[44] = 31'h41655c84;
    stim[45] = 31'h5541221b;
    stim[46] = 31'h5ce85a70;
    stim[47] = 31'h7ff69055;
    stim[48] = 31'h573ca8ce;
    stim[49] = 31'h514e48bf;
    stim[50] = 31'h7eb61e3f;
    stim[51] = 31'h71e0c1f4;
    stim[52] = 31'h736f0549;
    stim[53] = 31'h20f3d88b;
    stim[54] = 31'h6415fbb3;
    stim[55] = 31'h503a0e7e;
    stim[56] = 31'h75d6b13e;
    stim[57] = 31'h68d4dfca;
    stim[58] = 31'h43596ff9;
    stim[59] = 31'h58d5a397;
    stim[60] = 31'h7a6b7816;
    stim[61] = 31'h7622aeb1;
    stim[62] = 31'h637115d8;
    stim[63] = 31'h5016d5ed;
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
      expv[0] = 36'hxxxxxxxxc;
      expv[1] = 36'hxxxxxxxx3;
      expv[2] = 36'hxxxxxxxxe;
      expv[3] = 36'hxxxxxxxxc;
      expv[4] = 36'h000000e49;
      expv[5] = 36'h000000e41;
      expv[6] = 36'h000000e46;
      expv[7] = 36'h000000e4c;
      expv[8] = 36'h000003ae1;
      expv[9] = 36'h000001874;
      expv[10] = 36'h000001876;
      expv[11] = 36'h00000187e;
      expv[12] = 36'h000003674;
      expv[13] = 36'h000003673;
      expv[14] = 36'h000002c43;
      expv[15] = 36'h000003ebe;
      expv[16] = 36'h000003f3c;
      expv[17] = 36'h000003f31;
      expv[18] = 36'h000001593;
      expv[19] = 36'h00000258e;
      expv[20] = 36'h000003ebc;
      expv[21] = 36'h000003eb9;
      expv[22] = 36'h000001403;
      expv[23] = 36'h00000140e;
      expv[24] = 36'h000003dce;
      expv[25] = 36'h000000e7c;
      expv[26] = 36'h000000e71;
      expv[27] = 36'h000000e71;
      expv[28] = 36'h000002486;
      expv[29] = 36'h000002a76;
      expv[30] = 36'h00000367e;
      expv[31] = 36'h000003b9c;
      expv[32] = 36'h000003b99;
      expv[33] = 36'h000003b93;
      expv[34] = 36'h0000021fc;
      expv[35] = 36'h0000021f4;
      expv[36] = 36'h000005be6;
      expv[37] = 36'h000005be3;
      expv[38] = 36'h000003b5b;
      expv[39] = 36'h000003e3c;
      expv[40] = 36'h000000506;
      expv[41] = 36'h000001b16;
      expv[42] = 36'h0000034ac;
      expv[43] = 36'h0000034ac;
      expv[44] = 36'h00000578c;
      expv[45] = 36'h000005784;
      expv[46] = 36'h00000578e;
      expv[47] = 36'h000005784;
      expv[48] = 36'h000004e0b;
      expv[49] = 36'h000004e0c;
      expv[50] = 36'h000004e06;
      expv[51] = 36'h00000569b;
      expv[52] = 36'h00000354c;
      expv[53] = 36'h000000723;
      expv[54] = 36'h00000072b;
      expv[55] = 36'h00000000c;
      expv[56] = 36'h000000001;
      expv[57] = 36'h000001454;
      expv[58] = 36'h000002a26;
      expv[59] = 36'h000002a2e;
      expv[60] = 36'h000002a21;
      expv[61] = 36'h000004f23;
      expv[62] = 36'h000002993;
      expv[63] = 36'h000003fbe;
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
