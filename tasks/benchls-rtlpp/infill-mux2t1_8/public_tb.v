// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 17;
  localparam OW = 8;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  MUX2T1_8 dut (
    .I0(in_vec[16:9]),
    .I1(in_vec[8:1]),
    .s(in_vec[0:0]),
    .o(out_vec[7:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 17'h08c3c;
    stim[1] = 17'h05606;
    stim[2] = 17'h19583;
    stim[3] = 17'h00ac6;
    stim[4] = 17'h08991;
    stim[5] = 17'h10a04;
    stim[6] = 17'h10db5;
    stim[7] = 17'h00ed1;
    stim[8] = 17'h038db;
    stim[9] = 17'h1efe5;
    stim[10] = 17'h1a6ce;
    stim[11] = 17'h15067;
    stim[12] = 17'h12852;
    stim[13] = 17'h09020;
    stim[14] = 17'h1eaea;
    stim[15] = 17'h03c09;
    stim[16] = 17'h09572;
    stim[17] = 17'h194be;
    stim[18] = 17'h0c778;
    stim[19] = 17'h03cdd;
    stim[20] = 17'h17c73;
    stim[21] = 17'h13833;
    stim[22] = 17'h06a26;
    stim[23] = 17'h09f13;
    stim[24] = 17'h00260;
    stim[25] = 17'h0a1b2;
    stim[26] = 17'h0ea76;
    stim[27] = 17'h16f72;
    stim[28] = 17'h06ef8;
    stim[29] = 17'h1431b;
    stim[30] = 17'h10d96;
    stim[31] = 17'h10172;
    stim[32] = 17'h1c095;
    stim[33] = 17'h16889;
    stim[34] = 17'h1b343;
    stim[35] = 17'h1b845;
    stim[36] = 17'h1564d;
    stim[37] = 17'h10574;
    stim[38] = 17'h106fd;
    stim[39] = 17'h099bc;
    stim[40] = 17'h1a444;
    stim[41] = 17'h00c48;
    stim[42] = 17'h0ad1b;
    stim[43] = 17'h1c547;
    stim[44] = 17'h11ab0;
    stim[45] = 17'h04f7b;
    stim[46] = 17'h14ca0;
    stim[47] = 17'h19874;
    stim[48] = 17'h10f17;
    stim[49] = 17'h082b9;
    stim[50] = 17'h11754;
    stim[51] = 17'h0b875;
    stim[52] = 17'h07f64;
    stim[53] = 17'h154a0;
    stim[54] = 17'h19585;
    stim[55] = 17'h1043b;
    stim[56] = 17'h12cf4;
    stim[57] = 17'h0d0cb;
    stim[58] = 17'h08a0d;
    stim[59] = 17'h15fc9;
    stim[60] = 17'h1baa8;
    stim[61] = 17'h06f11;
    stim[62] = 17'h1026f;
    stim[63] = 17'h148b8;
    for (c = 0; c < N; c = c + 1) begin
      in_vec = stim[c];
      #1 sample;
      #1;
    end
    if ($value$plusargs("actual=%s", act_file)) begin
      fd = $fopen(act_file, "w");
      for (c = 0; c < N; c = c + 1) $fdisplay(fd, "%h", act[c]);
      $fclose(fd);
    end
    if (!$test$plusargs("nocheck")) begin
      expv[0] = 8'h46;
      expv[1] = 8'h2b;
      expv[2] = 8'hc1;
      expv[3] = 8'h05;
      expv[4] = 8'hc8;
      expv[5] = 8'h85;
      expv[6] = 8'hda;
      expv[7] = 8'h68;
      expv[8] = 8'h6d;
      expv[9] = 8'hf2;
      expv[10] = 8'hd3;
      expv[11] = 8'h33;
      expv[12] = 8'h94;
      expv[13] = 8'h48;
      expv[14] = 8'hf5;
      expv[15] = 8'h04;
      expv[16] = 8'h4a;
      expv[17] = 8'hca;
      expv[18] = 8'h63;
      expv[19] = 8'h6e;
      expv[20] = 8'h39;
      expv[21] = 8'h19;
      expv[22] = 8'h35;
      expv[23] = 8'h89;
      expv[24] = 8'h01;
      expv[25] = 8'h50;
      expv[26] = 8'h75;
      expv[27] = 8'hb7;
      expv[28] = 8'h37;
      expv[29] = 8'h8d;
      expv[30] = 8'h86;
      expv[31] = 8'h80;
      expv[32] = 8'h4a;
      expv[33] = 8'h44;
      expv[34] = 8'ha1;
      expv[35] = 8'h22;
      expv[36] = 8'h26;
      expv[37] = 8'h82;
      expv[38] = 8'h7e;
      expv[39] = 8'h4c;
      expv[40] = 8'hd2;
      expv[41] = 8'h06;
      expv[42] = 8'h8d;
      expv[43] = 8'ha3;
      expv[44] = 8'h8d;
      expv[45] = 8'hbd;
      expv[46] = 8'ha6;
      expv[47] = 8'hcc;
      expv[48] = 8'h8b;
      expv[49] = 8'h5c;
      expv[50] = 8'h8b;
      expv[51] = 8'h3a;
      expv[52] = 8'h3f;
      expv[53] = 8'haa;
      expv[54] = 8'hc2;
      expv[55] = 8'h1d;
      expv[56] = 8'h96;
      expv[57] = 8'h65;
      expv[58] = 8'h06;
      expv[59] = 8'he4;
      expv[60] = 8'hdd;
      expv[61] = 8'h88;
      expv[62] = 8'h37;
      expv[63] = 8'ha4;
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
