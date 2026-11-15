// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 66;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  mg_04724 dut (
    .CLK(clk),
    .DS(in_vec[66:66]),
    .ED(in_vec[65:65]),
    .MPYJ(in_vec[64:64]),
    .DR(in_vec[63:32]),
    .DI(in_vec[31:0]),
    .DOR(out_vec[65:33]),
    .DOI(out_vec[32:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h1195faba1fe1f6535;
    stim[1] = 67'h60ad7c9acb517a46e;
    stim[2] = 67'h75c775e542e30c7b0;
    stim[3] = 67'h49ac5452fc247c10c;
    stim[4] = 67'h26b7178290dc4db03;
    stim[5] = 67'h4d436bc66c3f2d947;
    stim[6] = 67'h5fa1417805e88beee;
    stim[7] = 67'h330d9829a8a5f25cc;
    stim[8] = 67'h15373c25ea6f6ecc1;
    stim[9] = 67'h594b4b4336b1c0df7;
    stim[10] = 67'h1ae34263d2e8a2209;
    stim[11] = 67'h41a511d4096d279ef;
    stim[12] = 67'h5a79d1143fbad42fc;
    stim[13] = 67'h3781a47fc5c6f63d3;
    stim[14] = 67'h26e6be3020f557366;
    stim[15] = 67'h4d98b44af59ddc30d;
    stim[16] = 67'h0ea2ffa42a854fa57;
    stim[17] = 67'h661673321d6dea11b;
    stim[18] = 67'h38a313550946d993e;
    stim[19] = 67'h0e805bdbe211ceac1;
    stim[20] = 67'h73ea547c94ded0a89;
    stim[21] = 67'h1550c5aa2c9728d85;
    stim[22] = 67'h1125b6301c18d9242;
    stim[23] = 67'h7c36b287e7ee17f00;
    stim[24] = 67'h43d9b74bec0cc2cd2;
    stim[25] = 67'h24d0cee02ad80fe7e;
    stim[26] = 67'h435454c13347b9e69;
    stim[27] = 67'h05705c9268c8d6773;
    stim[28] = 67'h56b84e89ac5402642;
    stim[29] = 67'h37a40cc6d97d18996;
    stim[30] = 67'h2d8113236c02d32f6;
    stim[31] = 67'h1656a3bab44cf1f0b;
    stim[32] = 67'h12c5450f1d086a09b;
    stim[33] = 67'h7fc43900a45883ae7;
    stim[34] = 67'h5ae0f79472833d385;
    stim[35] = 67'h159e8a9ca310df58a;
    stim[36] = 67'h4e7a31efaf9ff8078;
    stim[37] = 67'h5ffe8584b071825b1;
    stim[38] = 67'h4cbc8cfb675c80cf3;
    stim[39] = 67'h699c8d1d830a8ae54;
    stim[40] = 67'h47508a0a6bfcff73c;
    stim[41] = 67'h46625cd4f7b9dd90a;
    stim[42] = 67'h1329420f7f3a44d93;
    stim[43] = 67'h45a04406189c12715;
    stim[44] = 67'h7916d455db9c2af7f;
    stim[45] = 67'h32aaa14f2f6331925;
    stim[46] = 67'h231c9c1f1835bc2fc;
    stim[47] = 67'h72ef103ca12600e84;
    stim[48] = 67'h35234a90b7c98f1cf;
    stim[49] = 67'h44420c4a9377e0573;
    stim[50] = 67'h443dd667df284b1bb;
    stim[51] = 67'h15cfb2445b4a67ff1;
    stim[52] = 67'h5582e1da4cb09b8e4;
    stim[53] = 67'h26d1d035ecb57d637;
    stim[54] = 67'h79296ea0742d3dc34;
    stim[55] = 67'h492a394a5c4898024;
    stim[56] = 67'h21b7e05cf4f08811a;
    stim[57] = 67'h779b6387c0184a8ac;
    stim[58] = 67'h0a1e4b6f97c81ea7f;
    stim[59] = 67'h7aad97c019b823b55;
    stim[60] = 67'h163f32952ad1df232;
    stim[61] = 67'h5ea8d55aad03c9df5;
    stim[62] = 67'h3118385bd312ff2ef;
    stim[63] = 67'h3c3c09f58dfdf2375;
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
      expv[0] = 66'hxxxxxxxxxxxxxxxxx;
      expv[1] = 66'hxxxxxxxxxxxxxxxxx;
      expv[2] = 66'hxxxxxxxxxxxxxxxxx;
      expv[3] = 66'hxxxxxxxxxxxxxxxxx;
      expv[4] = 66'hxxxxxxxxxxxxxxxxx;
      expv[5] = 66'hxxxxxxxxxxxxxxxxx;
      expv[6] = 66'hxxxxxxxxxxxxxxxxx;
      expv[7] = 66'hxxxxxxxxxxxxxxxxx;
      expv[8] = 66'h01c557d9878d02a6c;
      expv[9] = 66'h01c557d9878d02a6c;
      expv[10] = 66'h01c557d9878d02a6c;
      expv[11] = 66'h01c557d9878d02a6c;
      expv[12] = 66'h01c557d9878d02a6c;
      expv[13] = 66'h01c557d9878d02a6c;
      expv[14] = 66'h078b3abef872fd594;
      expv[15] = 66'h078b3abef872fd594;
      expv[16] = 66'h078b3abef872fd594;
      expv[17] = 66'h078b3abef872fd594;
      expv[18] = 66'h078b3abef872fd594;
      expv[19] = 66'h078b3abef872fd594;
      expv[20] = 66'h078b3abef872fd594;
      expv[21] = 66'h078b3abef872fd594;
      expv[22] = 66'h078b3abef872fd594;
      expv[23] = 66'h078b3abef872fd594;
      expv[24] = 66'h0fe86e295ca42b328;
      expv[25] = 66'h0fe86e295ca42b328;
      expv[26] = 66'h0fe86e295ca42b328;
      expv[27] = 66'h0fe86e295ca42b328;
      expv[28] = 66'h0fe86e295ca42b328;
      expv[29] = 66'h0fe86e295ca42b328;
      expv[30] = 66'h361b166a1ae2642ef;
      expv[31] = 66'h14b8e54144f274cb0;
      expv[32] = 66'h14b8e54144f274cb0;
      expv[33] = 66'h14b8e54144f274cb0;
      expv[34] = 66'h14b8e54144f274cb0;
      expv[35] = 66'h14b8e54144f274cb0;
      expv[36] = 66'h14b8e54144f274cb0;
      expv[37] = 66'h14b8e54144f274cb0;
      expv[38] = 66'h14b8e54144f274cb0;
      expv[39] = 66'h14b8e54144f274cb0;
      expv[40] = 66'h14b8e54144f274cb0;
      expv[41] = 66'h14b8e54144f274cb0;
      expv[42] = 66'h14b8e54144f274cb0;
      expv[43] = 66'h14b8e54144f274cb0;
      expv[44] = 66'h14b8e54144f274cb0;
      expv[45] = 66'h14b8e54144f274cb0;
      expv[46] = 66'h2f4e5ca8804e1a59d;
      expv[47] = 66'h2f4e5ca896f876fff;
      expv[48] = 66'h34874830490789001;
      expv[49] = 66'h34874830490789001;
      expv[50] = 66'h34874830490789001;
      expv[51] = 66'h34874830490789001;
      expv[52] = 66'h34874830490789001;
      expv[53] = 66'h34874830490789001;
      expv[54] = 66'h34874830490789001;
      expv[55] = 66'h030044e2fc2aaff42;
      expv[56] = 66'h030044e2fc2aaff42;
      expv[57] = 66'h030044e2fc2aaff42;
      expv[58] = 66'h030044e2fc2aaff42;
      expv[59] = 66'h030044e2fc2aaff42;
      expv[60] = 66'h0aea10a2c8ef3ac29;
      expv[61] = 66'h0aea10a2c8ef3ac29;
      expv[62] = 66'h0aea10a2c8ef3ac29;
      expv[63] = 66'h0aea10a2c8ef3ac29;
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
