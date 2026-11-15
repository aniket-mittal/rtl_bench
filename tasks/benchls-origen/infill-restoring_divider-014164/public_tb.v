// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 67;
  localparam OW = 65;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_014164 dut (
    .div_clk(clk),
    .resetn(in_vec[66:66]),
    .div(in_vec[65:65]),
    .div_signed(in_vec[64:64]),
    .x(in_vec[63:32]),
    .y(in_vec[31:0]),
    .s(out_vec[64:33]),
    .r(out_vec[32:1]),
    .complete(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 67'h3674d2df86a8dc483;
    stim[1] = 67'h0e95c752f0bc21930;
    stim[2] = 67'h49af4beb11336ef4c;
    stim[3] = 67'h75436508da4f1f8b2;
    stim[4] = 67'h00450579b38ff5890;
    stim[5] = 67'h71a09529f0a54ce0e;
    stim[6] = 67'h7d451c9f0632f8efd;
    stim[7] = 67'h4e638ff63d1007e83;
    stim[8] = 67'h569498041ed3d02c4;
    stim[9] = 67'h60e6934858b7a0e69;
    stim[10] = 67'h4e0d8698ccc15cdd4;
    stim[11] = 67'h5884f9ef8a31759b7;
    stim[12] = 67'h711cbaaa1072da326;
    stim[13] = 67'h5bccaf2e7a7e0b631;
    stim[14] = 67'h630d55e0cbfa463b0;
    stim[15] = 67'h78ee5740dbcf93791;
    stim[16] = 67'h4218467dcb74f8159;
    stim[17] = 67'h533a1477486a5eb5a;
    stim[18] = 67'h734ad835d4809a545;
    stim[19] = 67'h635db3a14be86e81f;
    stim[20] = 67'h5b3222fff4565b6e6;
    stim[21] = 67'h678105d20c5d391f1;
    stim[22] = 67'h4acb3fdd6b445a0ed;
    stim[23] = 67'h731fdb573b797afba;
    stim[24] = 67'h52d5ff1babbfcf43c;
    stim[25] = 67'h6f5d2441f8dba7fa7;
    stim[26] = 67'h6e99b6374ef12cd61;
    stim[27] = 67'h6f3dfabb392b94a69;
    stim[28] = 67'h4a7850edc2802e71e;
    stim[29] = 67'h555868725e24a98af;
    stim[30] = 67'h4283e37f2ad393ebc;
    stim[31] = 67'h5048047e2ede6c50e;
    stim[32] = 67'h722a70dec0f877841;
    stim[33] = 67'h5d468f50b3fad9c68;
    stim[34] = 67'h78ffecfd41090d52f;
    stim[35] = 67'h65766773f2d214842;
    stim[36] = 67'h50a02a16068beb058;
    stim[37] = 67'h424588e6288a06d35;
    stim[38] = 67'h4d38bec7b0e88bb91;
    stim[39] = 67'h54c922cb0c11c3cad;
    stim[40] = 67'h4028725530b6d9e0d;
    stim[41] = 67'h6b1fa9e470b2586b6;
    stim[42] = 67'h52a62bd93cd8dde9c;
    stim[43] = 67'h610243d5dba04e09a;
    stim[44] = 67'h4280dcb0e257edb5f;
    stim[45] = 67'h4255f77ff2fca583a;
    stim[46] = 67'h4ab7aea3aae5bcb8e;
    stim[47] = 67'h5e04bf57f0da21cc7;
    stim[48] = 67'h6921e70fbd9859533;
    stim[49] = 67'h42ced19beb263bbd0;
    stim[50] = 67'h71e8c7c1718561ee5;
    stim[51] = 67'h55db7b6d46ca1daee;
    stim[52] = 67'h5b220ab0dd415073e;
    stim[53] = 67'h7bc2414750916939d;
    stim[54] = 67'h66e9fade22260b522;
    stim[55] = 67'h62e8fb676362e9377;
    stim[56] = 67'h7b5452209bc7b8f34;
    stim[57] = 67'h7488c3ff23a0b45c2;
    stim[58] = 67'h586812cae4ce8fe93;
    stim[59] = 67'h5b5b78f6c6b3c54e1;
    stim[60] = 67'h553f222c558b03317;
    stim[61] = 67'h60f4b9508d8440de6;
    stim[62] = 67'h6357c4424d82b0483;
    stim[63] = 67'h528019eb75b3a60f7;
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
      expv[0] = 65'h00000000000000000;
      expv[1] = 65'h00000000000000000;
      expv[2] = 65'h00000000000000000;
      expv[3] = 65'h00000000000000000;
      expv[4] = 65'h00000000000000000;
      expv[5] = 65'h00000000000000000;
      expv[6] = 65'h00000000000000000;
      expv[7] = 65'h00000000000000000;
      expv[8] = 65'h00000000000000000;
      expv[9] = 65'h00000000000000000;
      expv[10] = 65'h00000000000000000;
      expv[11] = 65'h00000000000000000;
      expv[12] = 65'h00000000000000000;
      expv[13] = 65'h00000000000000000;
      expv[14] = 65'h00000000000000000;
      expv[15] = 65'h00000000000000000;
      expv[16] = 65'h00000000000000000;
      expv[17] = 65'h00000000000000000;
      expv[18] = 65'h00000000000000000;
      expv[19] = 65'h00000000000000000;
      expv[20] = 65'h00000000000000000;
      expv[21] = 65'h00000000000000000;
      expv[22] = 65'h00000000000000000;
      expv[23] = 65'h00000000000000000;
      expv[24] = 65'h00000000000000000;
      expv[25] = 65'h00000000000000000;
      expv[26] = 65'h00000000000000000;
      expv[27] = 65'h00000000000000000;
      expv[28] = 65'h00000000000000000;
      expv[29] = 65'h00000000000000000;
      expv[30] = 65'h00000000000000000;
      expv[31] = 65'h00000000000000000;
      expv[32] = 65'h00000000000000000;
      expv[33] = 65'h00000000000000000;
      expv[34] = 65'h00000000000000000;
      expv[35] = 65'h00000000000000000;
      expv[36] = 65'h00000000000000000;
      expv[37] = 65'h00000000000000000;
      expv[38] = 65'h100000002055fb683;
      expv[39] = 65'h100000002055fb683;
      expv[40] = 65'h100000002055fb683;
      expv[41] = 65'h100000002055fb683;
      expv[42] = 65'h100000002055fb682;
      expv[43] = 65'h100000002055fb682;
      expv[44] = 65'h100000002055fb682;
      expv[45] = 65'h100000002055fb682;
      expv[46] = 65'h100000002055fb682;
      expv[47] = 65'h100000002055fb682;
      expv[48] = 65'h100000002055fb682;
      expv[49] = 65'h100000002055fb682;
      expv[50] = 65'h100000002055fb682;
      expv[51] = 65'h100000002055fb682;
      expv[52] = 65'h100000002055fb682;
      expv[53] = 65'h100000002055fb682;
      expv[54] = 65'h100000002055fb682;
      expv[55] = 65'h100000002055fb682;
      expv[56] = 65'h100000002055fb682;
      expv[57] = 65'h100000002055fb682;
      expv[58] = 65'h100000002055fb682;
      expv[59] = 65'h100000002055fb682;
      expv[60] = 65'h100000002055fb682;
      expv[61] = 65'h100000002055fb682;
      expv[62] = 65'h100000002055fb682;
      expv[63] = 65'h100000002055fb682;
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
