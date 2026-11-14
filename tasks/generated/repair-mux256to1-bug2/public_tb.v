// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 264;
  localparam OW = 1;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  dut dut (
    .in(in_vec[263:8]),
    .sel(in_vec[7:0]),
    .out(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 264'hd897ad86bcf440154a1deb75a81c142707b74a7e0132ef6fad9dbc3d045ea701c1;
    stim[1] = 264'hbb88d2d2b75b9879094cdfde4eee48faf908c94eb45fbbc232a118fe0b1721d725;
    stim[2] = 264'hf5f5e1c8a7dbc081642ee7b48e2a65050f0a89d0f95e26248c5859183296a62ed5;
    stim[3] = 264'h1d71549f1b5eb8de93f4484186414750efb12aa7d2f125ade04749dc2136d52fae;
    stim[4] = 264'h6ffca64ba7342d8d32a5e3c73fd979964f80b9479972bc596a87b4f7e5ab752ff8;
    stim[5] = 264'h9e14edda1d1bdcbe8a6d9a405ec51fed9363a58a4e656da5980a8a72e5a7346c7c;
    stim[6] = 264'h5d7141370cd942dc4989a1582e1fc17998e99e1ff3fe6a27c9ddcfafc6fed50b67;
    stim[7] = 264'h0d00d3fd03d8e75be596750a648ddbfa384e4d3519fc340688b8571deb2415683b;
    stim[8] = 264'h97e3a1cf1ed57b656687b7a71402f3c1edf92e8920b127f3d13c542f9ec3491897;
    stim[9] = 264'h3812169f0821d6d524a02741244dd3562d9a66105179668fd69ff1a49a82443849;
    stim[10] = 264'h6eb99bff2938c1278bd67aa778789e9bd24381fc79c3e463da5c9c347e6d908a8e;
    stim[11] = 264'h1f3e0245737ca1069fa55e5ae5b6c5d66b5c4b5c50694daa899962e2ff5de826a3;
    stim[12] = 264'h9cc3e8b47a951bcfda068f21ce9393532d8d883b0af5254bc225959d216daeef30;
    stim[13] = 264'h22b33fd315a4f977e6dfb84f9b5c8f99e8c5eb5ef796009fce1b84371981389e65;
    stim[14] = 264'h69997d63e120a0b12979044e4ed74149bb88a3206bb8825c262b33c29f6c29f5e6;
    stim[15] = 264'h212171e968e72c28207de5cc22aa381e2bea9af1a6cffcafc6c78eb44500214e6e;
    stim[16] = 264'h8a4a5bb15cf464bb8687d9b4cd403b08221954f64b8d630b853edcaaf4a375bd7f;
    stim[17] = 264'h583496c7050fc94917fb24195e32e624e53f2dd81bb12b3afd3d91ad49cfe63ebd;
    stim[18] = 264'h7d08959a357b20a6cf9b06849e47eee60779ce250095abf091a30e42581dab7323;
    stim[19] = 264'h6f30260ac7e66f60e2a41577be5c341cc5054eabfb13ef8b75cd189c714c26ab43;
    stim[20] = 264'h7c583d7103617d99e8acb1fa42ba90ca44ee8605dce17ff2e0d99d0543b5728728;
    stim[21] = 264'hd16095d97be7732c27a96cf6835baa0f278c3efce6bd6bdafdc563b6390d4d6d14;
    stim[22] = 264'h6fcad409e4c6e23b62eef49b8d9e1c6bdd10a046870035d4f554afa9c72fdbbde9;
    stim[23] = 264'hdab6ec1d8cd6adc0e15ea202e36337491060ce541bec0d12a3bbcb77e3b71badc3;
    stim[24] = 264'h60e5a0a074aa6db5572c0ad30c517284fcce0b21304aed4254271650b3a9707044;
    stim[25] = 264'h8908160b67a74502073c4134216a4e86fb0369ce7817a1d7ecdb42e16a2b215e47;
    stim[26] = 264'h354808ae1b1d11bdf6a979eec22fd622c08bd998dd6607c0fd1c03c4ee7dd99c05;
    stim[27] = 264'he61721754271b7320b3f2c4a1e26898a1e88c3e2dedc5274c1e3d77dcb0a0ee6b5;
    stim[28] = 264'he377a485a2fdc99c224014b2214e61a4ac9f2dd08445e5ad0876e0b52aabe67b31;
    stim[29] = 264'h976a4e4738e377a9b1910d792a498aa6a7a7dac47f5cd3295bfe04078251e99917;
    stim[30] = 264'h6fb6814c56b575f307c43f144b1b75bdd997d32dfc18b6dc001718975a4ceca02b;
    stim[31] = 264'hf491dd81b85cb0064ee4fecaa31bccf80639b9c44cd33ee49caa89ae6723a7c503;
    stim[32] = 264'h495b0bc3184d9418749a29f881dbdca11e684494306df14cd2240eb6745d8204d3;
    stim[33] = 264'h2401f792a00e37cbc129685eb1b11507cc0f7c1552c80abbf455339c21d3083655;
    stim[34] = 264'h3dd3d3344fb619a62957233b10f0ebfe07df7de73508d35c824601087b8bec599b;
    stim[35] = 264'h33c57c0ff7f4f93c1c6b5ae9b86a7152d3c94148bbcfa6d7caa10b569dd2c18719;
    stim[36] = 264'h339a5809c41ca05be6ff91ec6fa11d06a68c0b5ec5a042e0d3fe811b0892058614;
    stim[37] = 264'hbc2f25b1520d7c2b2995e0ed8a677aecf568cae07f30689f9d335cf30e34125f57;
    stim[38] = 264'hd8d4a76e10479a026355e49cd86525005599937ee13e5694c97995289c2efe6681;
    stim[39] = 264'h454331cf6076857bad87ebb3c92911fb48619b627de986a5dec46e19e1600fadcc;
    stim[40] = 264'h32b9f5fba3d9f13b25f4f28cc5af6165e1f123642393cc1af00e03b5eb3e54450f;
    stim[41] = 264'h853c080a0af94df45e2e094b95c4d9391419a5470aaec40caba9ca2654e721dfc8;
    stim[42] = 264'h14b26a2b0da81f17a72dba6c2507312038e3dda6293d09d5d1fc209e7798623595;
    stim[43] = 264'h24784cea6d765b4c574fee74a179e3ce494c539c4a15bc713db763032c24464dae;
    stim[44] = 264'h74fa189faee457744c046c1005da260859447f7feb2e2ed1665813a0dde4da2e78;
    stim[45] = 264'h1f2f1e96249ab495c4dd687d26794884988e2d13fa92c1a27bb901b3c77e3a8239;
    stim[46] = 264'h4dcb228fe8536a7282c2623c6c509ec87583dc2c66982283a357cdeca54a683f44;
    stim[47] = 264'h4f19bdf3b8256a8e78e751b94d4a51ae501dd07f305987f52545bc79c85b30f1e2;
    stim[48] = 264'h91eec54d22087842f418fea27aef934f75cbc55bd72774f77311072941a3aa8ac7;
    stim[49] = 264'h4b8b643e62de604d1a2289db2ac9ce20d57639407e1a21ffa3231b754373e70c8d;
    stim[50] = 264'he47c33445e788c42edc55e1c958f05aece6494405f66006faf949bf897d65a9f13;
    stim[51] = 264'h8fe8db87141ec49d9c9079fc01a428988c6e68083c34bc61802c913718edce906a;
    stim[52] = 264'hb340329897c07356647afa67348d47506074161f35fd105078e8ffd4ea8e3769dc;
    stim[53] = 264'he77cd19ea66c90a62b65b5b523f9bed9603c72d29168af326ceb52877e58678afb;
    stim[54] = 264'h7fcfd4a745ffdfb83cb98df22a0cbeebf58689221cc01a2734e417f4bbad31b12e;
    stim[55] = 264'hbdcb79a711e9faaffa0ba1802ba8e8d2e59fa98ab5925f07ae1f260192afca5a88;
    stim[56] = 264'hf33b8877c21d63a3f4364393003cb3a504e29dd05e59fd519c97d41ea446de9994;
    stim[57] = 264'h0fa8290f28618696352120fdf17f62e91048643abc257a3fd81b37af9d4c2b5e8c;
    stim[58] = 264'haf8da709ec151b060cf2e24d027f8104cbf68f422a098f77f59a8a3266dd0139d6;
    stim[59] = 264'h218288bc286e965db4fc6261c9ae72592d94ed431d40171c045a1b07bd01d76825;
    stim[60] = 264'h4e273e06e887dd8a408c7d9b67372eecdb4382086ab26d1d149ad9fbf411e5cb4e;
    stim[61] = 264'hcb83dcdbdcc425e3afda954e95b1e9228bdf0df75833e063c61ce6dc13156b396f;
    stim[62] = 264'h0ad0c30857ded25d8726cb1bc8af0923ab94f430dd783e90993b0a07c278f74a2f;
    stim[63] = 264'h63fc8014b1d75bccec4f030e0ed3337aca7d4c82e2782f6258175abf9c61a604bb;
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
      expv[0] = 1'h1;
      expv[1] = 1'h1;
      expv[2] = 1'h1;
      expv[3] = 1'h0;
      expv[4] = 1'h1;
      expv[5] = 1'h0;
      expv[6] = 1'h0;
      expv[7] = 1'h0;
      expv[8] = 1'h0;
      expv[9] = 1'h1;
      expv[10] = 1'h1;
      expv[11] = 1'h1;
      expv[12] = 1'h0;
      expv[13] = 1'h1;
      expv[14] = 1'h0;
      expv[15] = 1'h1;
      expv[16] = 1'h0;
      expv[17] = 1'h0;
      expv[18] = 1'h0;
      expv[19] = 1'h0;
      expv[20] = 1'h0;
      expv[21] = 1'h0;
      expv[22] = 1'h1;
      expv[23] = 1'h0;
      expv[24] = 1'h0;
      expv[25] = 1'h1;
      expv[26] = 1'h0;
      expv[27] = 1'h0;
      expv[28] = 1'h1;
      expv[29] = 1'h0;
      expv[30] = 1'h1;
      expv[31] = 1'h0;
      expv[32] = 1'h0;
      expv[33] = 1'h1;
      expv[34] = 1'h1;
      expv[35] = 1'h1;
      expv[36] = 1'h0;
      expv[37] = 1'h1;
      expv[38] = 1'h0;
      expv[39] = 1'h0;
      expv[40] = 1'h0;
      expv[41] = 1'h0;
      expv[42] = 1'h0;
      expv[43] = 1'h1;
      expv[44] = 1'h0;
      expv[45] = 1'h0;
      expv[46] = 1'h0;
      expv[47] = 1'h0;
      expv[48] = 1'h0;
      expv[49] = 1'h1;
      expv[50] = 1'h1;
      expv[51] = 1'h1;
      expv[52] = 1'h0;
      expv[53] = 1'h0;
      expv[54] = 1'h0;
      expv[55] = 1'h0;
      expv[56] = 1'h1;
      expv[57] = 1'h1;
      expv[58] = 1'h0;
      expv[59] = 1'h0;
      expv[60] = 1'h0;
      expv[61] = 1'h1;
      expv[62] = 1'h1;
      expv[63] = 1'h0;
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
