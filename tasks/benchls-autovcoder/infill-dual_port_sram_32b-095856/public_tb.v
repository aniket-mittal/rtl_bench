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

  autovcoder_095856 dut (
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
    stim[0] = 83'h5d7746084fac652b0d467;
    stim[1] = 83'h0b6d787d260c2f63c3951;
    stim[2] = 83'h1e7f85ca3142ff382f4fd;
    stim[3] = 83'h20be1f69572fc3ebd9b52;
    stim[4] = 83'h465cfc11a9400c69b4630;
    stim[5] = 83'h2c5069f9b53d37051774a;
    stim[6] = 83'h6c440f4b58515f8dfe234;
    stim[7] = 83'h1a4dfb3a47445105505d0;
    stim[8] = 83'h02b60484073ba0d103497;
    stim[9] = 83'h2dfa3caf51bf3d1071e41;
    stim[10] = 83'h6691cfdbb78cdbdfdb406;
    stim[11] = 83'h0e02c88a8ebd29ec0557b;
    stim[12] = 83'h64afb4fbe2d79fe805def;
    stim[13] = 83'h7a64a26b740c811dc1c5b;
    stim[14] = 83'h467b81a672dd42db4b320;
    stim[15] = 83'h30d6cb60d9fa4588b589d;
    stim[16] = 83'h406ffc09f37a62db6649e;
    stim[17] = 83'h6366266145ba131e1b69b;
    stim[18] = 83'h1c7cf490b7655f013b364;
    stim[19] = 83'h0e9158299ecaa5022bbe2;
    stim[20] = 83'h498fb60f60b9c7c425b32;
    stim[21] = 83'h37970e26de322423847fe;
    stim[22] = 83'h3793b81a4fdc7591bdae3;
    stim[23] = 83'h2f6cd3da41c1a9e47c823;
    stim[24] = 83'h2ec65d32adc612d3d7482;
    stim[25] = 83'h51562e480c6ec37c8bb1a;
    stim[26] = 83'h21504f81b5948028020c6;
    stim[27] = 83'h0bd1157eb413450d14647;
    stim[28] = 83'h5d3df38d3eea9994fcd12;
    stim[29] = 83'h53f0966199a79edaf64be;
    stim[30] = 83'h10dd3ab340316458d52cb;
    stim[31] = 83'h07f566456fd57d2a1ca39;
    stim[32] = 83'h1c9ed2d0924b3f71486db;
    stim[33] = 83'h021d6f996442a94e67bd6;
    stim[34] = 83'h472df3c1627d91fac97e6;
    stim[35] = 83'h22c236c604a05f2e096d1;
    stim[36] = 83'h0593a8c3436585a603749;
    stim[37] = 83'h69602cd33cf7d7fe48dd4;
    stim[38] = 83'h767a03412f05953287ba7;
    stim[39] = 83'h32621cb90364b0eb2e4af;
    stim[40] = 83'h570cef87e5ea1412cdf52;
    stim[41] = 83'h5cebe8a898e2732b65d56;
    stim[42] = 83'h00d3ce64619a0d19cd44d;
    stim[43] = 83'h518e56ed469cf72c49adb;
    stim[44] = 83'h2b08f006f35f34877ed36;
    stim[45] = 83'h5e853f2cc8cb0da259da6;
    stim[46] = 83'h3f0cec41a0c11bed95a6c;
    stim[47] = 83'h71e3b6c5960433ec9eed3;
    stim[48] = 83'h0e9f0c8c165a89d0503af;
    stim[49] = 83'h07a6eae5d5b0cbc96cda8;
    stim[50] = 83'h02ecb02eb79a31e0b343e;
    stim[51] = 83'h7e4140e5758164363d03b;
    stim[52] = 83'h2e6146e35cc271dfd37e2;
    stim[53] = 83'h6318bfa0c2436139e2432;
    stim[54] = 83'h53783e030f28e85973656;
    stim[55] = 83'h35c1ca45065787ece8a4b;
    stim[56] = 83'h74ba56d40ab89a7cbd9c8;
    stim[57] = 83'h51914fe9da5e609c557ee;
    stim[58] = 83'h0be53c63ad24742bed74f;
    stim[59] = 83'h13246c9d6ffeb6045043f;
    stim[60] = 83'h04bef74dffb003bc112ef;
    stim[61] = 83'h2feaf931b11275fb33140;
    stim[62] = 83'h1c559e9db591d9fde3545;
    stim[63] = 83'h27a014a53d89861ce4bd3;
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
      expv[19] = 64'h41a7e6d4xxxxxxxx;
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
      expv[39] = 64'hxxxxxxxx08db1812;
      expv[40] = 64'hxxxxxxxxxxxxxxxx;
      expv[41] = 64'hxxxxxxxx08db1812;
      expv[42] = 64'hxxxxxxxxxxxxxxxx;
      expv[43] = 64'hxxxxxxxxxxxxxxxx;
      expv[44] = 64'hxxxxxxxxxxxxxxxx;
      expv[45] = 64'hxxxxxxxxxxxxxxxx;
      expv[46] = 64'hxxxxxxxx08db1812;
      expv[47] = 64'hxxxxxxxx08db1812;
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
