// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 37;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  rtlpp_08600 dut (
    .clk(clk),
    .address(in_vec[36:35]),
    .chipselect(in_vec[34:34]),
    .reset_n(in_vec[33:33]),
    .write_n(in_vec[32:32]),
    .writedata(in_vec[31:0]),
    .out_port(out_vec[32:32]),
    .readdata(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 37'h0c1cb9405f;
    stim[1] = 37'h15eb853816;
    stim[2] = 37'h07125ed737;
    stim[3] = 37'h0a2a095efb;
    stim[4] = 37'h06561626e8;
    stim[5] = 37'h07406257d4;
    stim[6] = 37'h033c3d9c80;
    stim[7] = 37'h068ae4a1e5;
    stim[8] = 37'h0a9d73e365;
    stim[9] = 37'h0360ae32b9;
    stim[10] = 37'h0e4e92b7d7;
    stim[11] = 37'h039e34a03e;
    stim[12] = 37'h1e1bb678f6;
    stim[13] = 37'h1e7462b8f4;
    stim[14] = 37'h1fcf1cfeee;
    stim[15] = 37'h06c56413df;
    stim[16] = 37'h0f0a7e409a;
    stim[17] = 37'h128027f2c2;
    stim[18] = 37'h12a0cbab3f;
    stim[19] = 37'h06d62994a1;
    stim[20] = 37'h060ab9204a;
    stim[21] = 37'h02f130a6b6;
    stim[22] = 37'h13376385ee;
    stim[23] = 37'h1ed2e3b77b;
    stim[24] = 37'h0f54310942;
    stim[25] = 37'h12e2c44b85;
    stim[26] = 37'h1760c88e94;
    stim[27] = 37'h0b03ebb01c;
    stim[28] = 37'h0e60231b9b;
    stim[29] = 37'h12a7cc593b;
    stim[30] = 37'h179ace065a;
    stim[31] = 37'h16b1ef2897;
    stim[32] = 37'h0fc484adc8;
    stim[33] = 37'h122a5bdef2;
    stim[34] = 37'h1f947fb644;
    stim[35] = 37'h0e7cff9036;
    stim[36] = 37'h0e11154768;
    stim[37] = 37'h1a6b495b09;
    stim[38] = 37'h0323c38b4a;
    stim[39] = 37'h125093bf14;
    stim[40] = 37'h1b3827b983;
    stim[41] = 37'h0ba0746b57;
    stim[42] = 37'h0b043fe6b3;
    stim[43] = 37'h0ae34b0e4b;
    stim[44] = 37'h12c52b6859;
    stim[45] = 37'h17c86a9b48;
    stim[46] = 37'h0a599cfb06;
    stim[47] = 37'h028eccb64c;
    stim[48] = 37'h1b6af90dc5;
    stim[49] = 37'h0be522be37;
    stim[50] = 37'h0e36c684c8;
    stim[51] = 37'h1bd3e2f4e0;
    stim[52] = 37'h0b19c3c701;
    stim[53] = 37'h060e2915cd;
    stim[54] = 37'h0337b6cb93;
    stim[55] = 37'h1b08f71867;
    stim[56] = 37'h1afcc0297b;
    stim[57] = 37'h1ef2ec5c34;
    stim[58] = 37'h07c89a565a;
    stim[59] = 37'h179f61fb44;
    stim[60] = 37'h1321f3fab0;
    stim[61] = 37'h1ee2063895;
    stim[62] = 37'h0e7020d6f0;
    stim[63] = 37'h0beec85040;
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
      expv[0] = 33'h000000000;
      expv[1] = 33'h000000000;
      expv[2] = 33'h000000000;
      expv[3] = 33'h000000000;
      expv[4] = 33'h000000000;
      expv[5] = 33'h000000000;
      expv[6] = 33'h000000000;
      expv[7] = 33'h000000000;
      expv[8] = 33'h100000000;
      expv[9] = 33'h100000001;
      expv[10] = 33'h100000000;
      expv[11] = 33'h100000001;
      expv[12] = 33'h100000000;
      expv[13] = 33'h100000000;
      expv[14] = 33'h100000000;
      expv[15] = 33'h100000001;
      expv[16] = 33'h100000000;
      expv[17] = 33'h100000000;
      expv[18] = 33'h100000000;
      expv[19] = 33'h100000001;
      expv[20] = 33'h100000001;
      expv[21] = 33'h000000000;
      expv[22] = 33'h000000000;
      expv[23] = 33'h000000000;
      expv[24] = 33'h000000000;
      expv[25] = 33'h000000000;
      expv[26] = 33'h000000000;
      expv[27] = 33'h000000000;
      expv[28] = 33'h000000000;
      expv[29] = 33'h000000000;
      expv[30] = 33'h000000000;
      expv[31] = 33'h000000000;
      expv[32] = 33'h000000000;
      expv[33] = 33'h000000000;
      expv[34] = 33'h000000000;
      expv[35] = 33'h000000000;
      expv[36] = 33'h000000000;
      expv[37] = 33'h000000000;
      expv[38] = 33'h000000000;
      expv[39] = 33'h000000000;
      expv[40] = 33'h000000000;
      expv[41] = 33'h000000000;
      expv[42] = 33'h000000000;
      expv[43] = 33'h000000000;
      expv[44] = 33'h000000000;
      expv[45] = 33'h000000000;
      expv[46] = 33'h000000000;
      expv[47] = 33'h000000000;
      expv[48] = 33'h000000000;
      expv[49] = 33'h000000000;
      expv[50] = 33'h000000000;
      expv[51] = 33'h000000000;
      expv[52] = 33'h000000000;
      expv[53] = 33'h000000000;
      expv[54] = 33'h100000001;
      expv[55] = 33'h100000000;
      expv[56] = 33'h100000000;
      expv[57] = 33'h100000000;
      expv[58] = 33'h100000001;
      expv[59] = 33'h100000000;
      expv[60] = 33'h100000000;
      expv[61] = 33'h100000000;
      expv[62] = 33'h100000000;
      expv[63] = 33'h100000000;
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
