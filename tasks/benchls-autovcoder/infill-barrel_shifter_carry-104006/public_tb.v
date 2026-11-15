// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 74;
  localparam OW = 33;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_104006 dut (
    .in_data(in_vec[73:42]),
    .shift_amt_reg(in_vec[41:10]),
    .shift_control(in_vec[9:7]),
    .shift_amt_imm(in_vec[6:2]),
    .enable(in_vec[1:1]),
    .carry_flag(in_vec[0:0]),
    .out_data(out_vec[32:1]),
    .carry_out_flag(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 74'h2fb71c3beb9a5cff645;
    stim[1] = 74'h1a3b9065a71ef6c0152;
    stim[2] = 74'h3c5386ac1b2e1dec0f6;
    stim[3] = 74'h3cc0aa77921e1022365;
    stim[4] = 74'h399dbc64198d3a5080b;
    stim[5] = 74'h04c2eea8b52febb55a9;
    stim[6] = 74'h3d578c243ce89c220ae;
    stim[7] = 74'h25314e2f22f351d3aa0;
    stim[8] = 74'h1b2ca9cbb8e9e3069f5;
    stim[9] = 74'h11ce8e595acac0d9708;
    stim[10] = 74'h391e3f56dfcbe9fda08;
    stim[11] = 74'h170b1c0a2a25771509c;
    stim[12] = 74'h03f06590a7c89fd3d17;
    stim[13] = 74'h3c2a725975bae1dce8f;
    stim[14] = 74'h0874da8610b8cf64b11;
    stim[15] = 74'h1cf1092b0a98984cc08;
    stim[16] = 74'h250eabe0fef3f65d83e;
    stim[17] = 74'h2538c5f55ef4a68ed19;
    stim[18] = 74'h29ddbbeefc3cddef244;
    stim[19] = 74'h064b38ae1d705b5c49d;
    stim[20] = 74'h3eaa348d9b61bd5d36f;
    stim[21] = 74'h1923d946f1137feff30;
    stim[22] = 74'h1dd2f3a5b81f8a7648c;
    stim[23] = 74'h1f4c48dc800956c44ab;
    stim[24] = 74'h3d8443025bbc9ac5477;
    stim[25] = 74'h00ca3456a8460bb125b;
    stim[26] = 74'h0616606342e5bcb620d;
    stim[27] = 74'h3fdc77d003809e6751d;
    stim[28] = 74'h3c0640b7b33dd7f1faa;
    stim[29] = 74'h0c2865443c1cf149e23;
    stim[30] = 74'h0ed760938ac4de0fd9c;
    stim[31] = 74'h1f8f491bba7a4e4cc3e;
    stim[32] = 74'h16d0c9c168a82be9b11;
    stim[33] = 74'h166635949da1db8432d;
    stim[34] = 74'h09ba3d4dfdd2a2e0e65;
    stim[35] = 74'h35e9ef445473ec507e9;
    stim[36] = 74'h2f91551e5f2184b042b;
    stim[37] = 74'h0e7101c2dd8c6a45e0a;
    stim[38] = 74'h3985cfc030c1aa34978;
    stim[39] = 74'h31f6c90270d449c431a;
    stim[40] = 74'h2f3a0139d4508fd8c26;
    stim[41] = 74'h0eb867c9ed55c4db82e;
    stim[42] = 74'h0d8447be4c2e0e11bbf;
    stim[43] = 74'h0e189634da93d7a870e;
    stim[44] = 74'h08c2c966cfbaa9cb504;
    stim[45] = 74'h2f7402e89375777f75b;
    stim[46] = 74'h22476b53b42669a2db9;
    stim[47] = 74'h02c127caffe85882516;
    stim[48] = 74'h2772f502a6533c74e3b;
    stim[49] = 74'h2267b9390477031fa73;
    stim[50] = 74'h25c6beeb24695b1dfc7;
    stim[51] = 74'h11a9039b5612a918865;
    stim[52] = 74'h15c22059c70bf6bd257;
    stim[53] = 74'h28a54502fe8177834c5;
    stim[54] = 74'h303a00d8b6ba8dc84d9;
    stim[55] = 74'h2e160cc972b30c9a084;
    stim[56] = 74'h0a32b7f5af540173c95;
    stim[57] = 74'h2582804571b261d6f5f;
    stim[58] = 74'h1355f765ab43b961207;
    stim[59] = 74'h30507d36e147f4333d7;
    stim[60] = 74'h1bda5f3c6cc74659aa1;
    stim[61] = 74'h0bcbf277fc9aed0099d;
    stim[62] = 74'h151dcbad2c5688c8c85;
    stim[63] = 74'h1b5c40731fc9b8e4dc0;
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
      expv[0] = 33'hxxxxxxxxx;
      expv[1] = 33'h000000d1d;
      expv[2] = 33'h000000d1d;
      expv[3] = 33'h000000d1d;
      expv[4] = 33'h133b78c81;
      expv[5] = 33'h133b78c81;
      expv[6] = 33'h00000000x;
      expv[7] = 33'h00000000x;
      expv[8] = 33'h00000000x;
      expv[9] = 33'h00000000x;
      expv[10] = 33'h00000000x;
      expv[11] = 33'h00000000x;
      expv[12] = 33'h000fc1964;
      expv[13] = 33'h000fc1964;
      expv[14] = 33'h000fc1964;
      expv[15] = 33'h000fc1964;
      expv[16] = 33'h0af830001;
      expv[17] = 33'h0af830001;
      expv[18] = 33'h0af830001;
      expv[19] = 33'h0af830001;
      expv[20] = 33'h0af830000;
      expv[21] = 33'h0af830000;
      expv[22] = 33'h0af830000;
      expv[23] = 33'h00000000x;
      expv[24] = 33'h00000000x;
      expv[25] = 33'h00000000x;
      expv[26] = 33'h00000000x;
      expv[27] = 33'h00000000x;
      expv[28] = 33'h00000000x;
      expv[29] = 33'h00000000x;
      expv[30] = 33'h00000000x;
      expv[31] = 33'h1246e0000;
      expv[32] = 33'h1246e0000;
      expv[33] = 33'h1246e0000;
      expv[34] = 33'h1246e0000;
      expv[35] = 33'h1246e0000;
      expv[36] = 33'h02aa3c801;
      expv[37] = 33'h02aa3c801;
      expv[38] = 33'h02aa3c801;
      expv[39] = 33'h02aa3c800;
      expv[40] = 33'h02aa3c800;
      expv[41] = 33'h02aa3c800;
      expv[42] = 33'h02aa3c800;
      expv[43] = 33'h02aa3c800;
      expv[44] = 33'h02aa3c800;
      expv[45] = 33'h02aa3c800;
      expv[46] = 33'h02aa3c800;
      expv[47] = 33'h000b049f2;
      expv[48] = 33'h000b049f2;
      expv[49] = 33'h000b049f2;
      expv[50] = 33'h000b049f2;
      expv[51] = 33'h000b049f2;
      expv[52] = 33'h000b049f2;
      expv[53] = 33'h000b049f2;
      expv[54] = 33'h000b049f2;
      expv[55] = 33'h000b049f2;
      expv[56] = 33'h000b049f2;
      expv[57] = 33'h000b049f2;
      expv[58] = 33'h000b049f2;
      expv[59] = 33'h000b049f2;
      expv[60] = 33'h000b049f2;
      expv[61] = 33'h000b049f2;
      expv[62] = 33'h000b049f2;
      expv[63] = 33'h000b049f2;
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
