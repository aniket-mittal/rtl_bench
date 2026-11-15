// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 83;
  localparam OW = 64;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_095857 dut (
    .clka(clk),
    .cena_i(in_vec[82:82]),
    .oena_i(in_vec[81:81]),
    .wena_i(in_vec[80:80]),
    .addra_i(in_vec[79:74]),
    .dataa_i(in_vec[73:42]),
    .clkb(in_vec[41:41]),
    .cenb_i(in_vec[40:40]),
    .oenb_i(in_vec[39:39]),
    .wenb_i(in_vec[38:38]),
    .addrb_i(in_vec[37:32]),
    .datab_i(in_vec[31:0]),
    .dataa_o(out_vec[63:32]),
    .datab_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 83'h5735edd3b25c3d40e1d36;
    stim[1] = 83'h451f3dab90df47be03e3e;
    stim[2] = 83'h02a13aabe97ed84c3c1c8;
    stim[3] = 83'h34df166946f7e42705e85;
    stim[4] = 83'h2a64df7ba8e9478486acd;
    stim[5] = 83'h2829cd0002214bfa0a041;
    stim[6] = 83'h529d9aff22f9f5a4596ad;
    stim[7] = 83'h097a5a3e86cabc1246c19;
    stim[8] = 83'h578cbb8a6a050c0e5e135;
    stim[9] = 83'h4c78a28d2b6c218c18dc3;
    stim[10] = 83'h31b8f5446e9505badf028;
    stim[11] = 83'h55014730abb2d44d180e2;
    stim[12] = 83'h23301f628dcf300236011;
    stim[13] = 83'h37c8042e53e2d5b4a6701;
    stim[14] = 83'h4bffdca4feabdd68a9e68;
    stim[15] = 83'h1e09d67080d4878e53f39;
    stim[16] = 83'h17fa629f1fe2664a332b3;
    stim[17] = 83'h50a714c7ab6b5f075f615;
    stim[18] = 83'h6f13716e23070a4fdfefc;
    stim[19] = 83'h16c812e135abb0665ddb1;
    stim[20] = 83'h2cda34e5f74a86517b853;
    stim[21] = 83'h32f8a27135979c1575e67;
    stim[22] = 83'h0a856f93c56da10d40ec1;
    stim[23] = 83'h36857236639ddbc84e372;
    stim[24] = 83'h072647be881abc75cc170;
    stim[25] = 83'h69d492cb269fc1d8bd646;
    stim[26] = 83'h731bcae05f4f95c29fcb1;
    stim[27] = 83'h1908c394d408d61170d6b;
    stim[28] = 83'h555aa0211a54d3fbaf13c;
    stim[29] = 83'h2eb45cebd1363e7a5529f;
    stim[30] = 83'h2c8792892c4bf2164a18a;
    stim[31] = 83'h60aa0097294b85b792914;
    stim[32] = 83'h06ca09459feadb6f44de5;
    stim[33] = 83'h527eceaad97abd3e377e7;
    stim[34] = 83'h3cca4ee58f9f023e5cb14;
    stim[35] = 83'h6a319d36bfd4fe4802090;
    stim[36] = 83'h7a1333c4a5b7c93601c4c;
    stim[37] = 83'h553548f1a00dee9213f7f;
    stim[38] = 83'h2f3338e0d7479dc07dabc;
    stim[39] = 83'h63f6a993829fcdec9e388;
    stim[40] = 83'h53b70758cf88da908b03d;
    stim[41] = 83'h3c9efdb9587d932d1ebe2;
    stim[42] = 83'h087a91f36305bdfdce3b5;
    stim[43] = 83'h295d4e5bc13064aef44bc;
    stim[44] = 83'h5c701ebdf2da852f0367d;
    stim[45] = 83'h37c9b3e4ebeeeb94d0762;
    stim[46] = 83'h55aa12799420cdcf34882;
    stim[47] = 83'h54a2e9d10d6a982fe8eb9;
    stim[48] = 83'h14b3491a08753c73f59ae;
    stim[49] = 83'h3ac40ff7cb68de75e8a77;
    stim[50] = 83'h7ca0339138d4426f92767;
    stim[51] = 83'h3fdcb367c2bb30fa08371;
    stim[52] = 83'h43bcda468a56309f739ab;
    stim[53] = 83'h45f8eb30229315235d1e3;
    stim[54] = 83'h30b4a79b73f0fda6e1364;
    stim[55] = 83'h15af78e6bd9f6e3d5b9e8;
    stim[56] = 83'h79f9314232d24aded0902;
    stim[57] = 83'h0ec0b0db48904aa319b9d;
    stim[58] = 83'h082918e2e810ff9f5aa1e;
    stim[59] = 83'h0d85b37762e0e7177dd65;
    stim[60] = 83'h563315861be58a977b6f9;
    stim[61] = 83'h5ea37136476006ee19ac3;
    stim[62] = 83'h6c15c6e403701fcc74afc;
    stim[63] = 83'h5a75f079270ab2e04ad4f;
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
      expv[3] = 64'hxxxxxxxxxxxxxxxx;
      expv[4] = 64'hxxxxxxxxxxxxxxxx;
      expv[5] = 64'hxxxxxxxxxxxxxxxx;
      expv[6] = 64'hxxxxxxxxxxxxxxxx;
      expv[7] = 64'hxxxxxxxxxxxxxxxx;
      expv[8] = 64'hxxxxxxxxxxxxxxxx;
      expv[9] = 64'hxxxxxxxxxxxxxxxx;
      expv[10] = 64'hxxxxxxxxxxxxxxxx;
      expv[11] = 64'hxxxxxxxxxxxxxxxx;
      expv[12] = 64'hxxxxxxxxxxxxxxxx;
      expv[13] = 64'hxxxxxxxxxxxxxxxx;
      expv[14] = 64'hxxxxxxxxxxxxxxxx;
      expv[15] = 64'hxxxxxxxxxxxxxxxx;
      expv[16] = 64'hxxxxxxxxxxxxxxxx;
      expv[17] = 64'hxxxxxxxxxxxxxxxx;
      expv[18] = 64'hxxxxxxxxxxxxxxxx;
      expv[19] = 64'hxxxxxxxxxxxxxxxx;
      expv[20] = 64'hxxxxxxxxxxxxxxxx;
      expv[21] = 64'hxxxxxxxxxxxxxxxx;
      expv[22] = 64'hxxxxxxxxxxxxxxxx;
      expv[23] = 64'hxxxxxxxxxxxxxxxx;
      expv[24] = 64'hxxxxxxxxxxxxxxxx;
      expv[25] = 64'hxxxxxxxxxxxxxxxx;
      expv[26] = 64'hxxxxxxxxxxxxxxxx;
      expv[27] = 64'hxxxxxxxxxxxxxxxx;
      expv[28] = 64'hxxxxxxxxxxxxxxxx;
      expv[29] = 64'hxxxxxxxxxxxxxxxx;
      expv[30] = 64'hxxxxxxxxxxxxxxxx;
      expv[31] = 64'hxxxxxxxxxxxxxxxx;
      expv[32] = 64'hxxxxxxxxxxxxxxxx;
      expv[33] = 64'hxxxxxxxxxxxxxxxx;
      expv[34] = 64'hxxxxxxxxxxxxxxxx;
      expv[35] = 64'hxxxxxxxxxxxxxxxx;
      expv[36] = 64'hxxxxxxxxxxxxxxxx;
      expv[37] = 64'hxxxxxxxxxxxxxxxx;
      expv[38] = 64'hxxxxxxxxxxxxxxxx;
      expv[39] = 64'hxxxxxxxxxxxxxxxx;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxxxxxxxxxx;
      expv[42] = 64'h1e4a24b1xxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxxxxxxxxxxxxxxxx;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'hxxxxxxxxxxxxxxxx;
      expv[47] = 64'hxxxxxxxxxxxxxxxx;
      expv[48] = 64'hxxxxxxxxxxxxxxxx;
      expv[49] = 64'hxxxxxxxxxxxxxxxx;
      expv[50] = 64'hxxxxxxxxxxxxxxxx;
      expv[51] = 64'hxxxxxxxxxxxxxxxx;
      expv[52] = 64'hxxxxxxxxxxxxxxxx;
      expv[53] = 64'hxxxxxxxxxxxxxxxx;
      expv[54] = 64'hxxxxxxxxxxxxxxxx;
      expv[55] = 64'hxxxxxxxxxxxxxxxx;
      expv[56] = 64'hxxxxxxxxxxxxxxxx;
      expv[57] = 64'hxxxxxxxxxxxxxxxx;
      expv[58] = 64'hxxxxxxxxxxxxxxxx;
      expv[59] = 64'hxxxxxxxxxxxxxxxx;
      expv[60] = 64'hxxxxxxxxxxxxxxxx;
      expv[61] = 64'hxxxxxxxxxxxxxxxx;
      expv[62] = 64'hxxxxxxxxxxxxxxxx;
      expv[63] = 64'hxxxxxxxxxxxxxxxx;
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
