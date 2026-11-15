// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 147;
  localparam OW = 128;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_198389 dut (
    .clk_i(clk),
    .tval2_i(in_vec[146:115]),
    .tval1_i(in_vec[114:83]),
    .data_bi(in_vec[82:51]),
    .icconf_i(in_vec[50:19]),
    .addr_bi(in_vec[18:6]),
    .ins_i(in_vec[5:5]),
    .we_bi(in_vec[4:4]),
    .en_i(in_vec[3:3]),
    .rst_i(in_vec[2:2]),
    .ictmr_i(in_vec[1:0]),
    .data_bo(out_vec[127:96]),
    .icov_o(out_vec[95:64]),
    .icbne_o(out_vec[63:32]),
    .icconf_o(out_vec[31:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 147'h150ed960deba02f6913166fc60bf4283c94e6;
    stim[1] = 147'h17f2c784f4231d161c5d7226d86fb3f98c0ce;
    stim[2] = 147'h3d5c7bd798f664b67185fb70d91f6c254c594;
    stim[3] = 147'h528517f09b70537b10b490505cb66ebab45c2;
    stim[4] = 147'h1cfc0d4999c343b7027d2055c357b62b34b53;
    stim[5] = 147'h47a0c06f251c80b55d2f9cc20c39f75df1541;
    stim[6] = 147'h15a8903825c5fd0015c93ed4aed0206ded252;
    stim[7] = 147'h37a64f1d17f7e296eb02f6fc39a74098b6493;
    stim[8] = 147'h23686ce82bbca1f6e53950d0268dfde610a92;
    stim[9] = 147'h1e5cf43f25a25a0c6cd7ff7ac575ee48e9a1a;
    stim[10] = 147'h09c450428ec698f74fc90fc5a159f656669c8;
    stim[11] = 147'h4c0d869bc89f4859e56bc737348d3171261f2;
    stim[12] = 147'h58e4c9a77bf1825bd7c95e0a3056d95d6e52a;
    stim[13] = 147'h55acaafa3ab7eb4f6af177f5463d1ca08f47a;
    stim[14] = 147'h53c15fb8bf6d2d03e93c94535dc55ca417b3a;
    stim[15] = 147'h668a3ad320f3b794537df7ae2847fc24d32b1;
    stim[16] = 147'h1fdc3c720cf1f333d660aa0be0247a95b1b70;
    stim[17] = 147'h339a9c110553147fcdbea7d7182b7382d3ec2;
    stim[18] = 147'h345a6a8490edd5d59415a4dd45d24ec22c7b9;
    stim[19] = 147'h4d3c95493c096eba719787f798416a2fc011a;
    stim[20] = 147'h68488cdaf89de51b81b1cfc346925f3942310;
    stim[21] = 147'h4892ebfc4eda23b3fca7795b689bdb15db082;
    stim[22] = 147'h480635ebee5e42fec06eb80d21f0a0b2d749a;
    stim[23] = 147'h3f9610e495f4930e6a75f1c0c8e974adf6940;
    stim[24] = 147'h0930e01fa6f602df6783ae91d1b4198009750;
    stim[25] = 147'h31e82d5af73ad20ad115582f711d138788ee0;
    stim[26] = 147'h5e00047a792fdbdbe7f461e652f113912a628;
    stim[27] = 147'h1f427872762779a25ff50ecf09cd1432db2b8;
    stim[28] = 147'h5b4f51717c012751154da7f05f84807048a22;
    stim[29] = 147'h69b999bfb51cdd3a98af9843d5a118feaef65;
    stim[30] = 147'h06b5b9bb5dcd728269c18d6468bdcead7558a;
    stim[31] = 147'h1b76221ad077d4fc9b0ff974608a7b907b482;
    stim[32] = 147'h523419ebd56e90341b9378544c4066ee0ea61;
    stim[33] = 147'h72714d14e4a1f1a38819d395c7c4e99fef553;
    stim[34] = 147'h64b0925709d0c80d079963169cc0cbfca9810;
    stim[35] = 147'h3f0b0f4bbdc4cb47962f80d23863d1e3ead90;
    stim[36] = 147'h6dafd867be371b680bdc4d2e2b1888550a010;
    stim[37] = 147'h781fac29e6e1933033acf7f6ee32583904682;
    stim[38] = 147'h24a387a13cc59ede5b40784449a4df5f22192;
    stim[39] = 147'h31e982c32c209889acadaf6e804be2cfe6972;
    stim[40] = 147'h4bb2dc075959fd010e1b5125113c657919cd3;
    stim[41] = 147'h0c9bcfb2c0bfef351bad6db01798f804e5a52;
    stim[42] = 147'h7037a35ea2e69f8884970d03f454ade22ef1f;
    stim[43] = 147'h1f48b1b940e2ca7cc897b471d37028b7b85d9;
    stim[44] = 147'h0916dc931ca4f9475ec4fd16699956ab5e63a;
    stim[45] = 147'h6bfb5d385affdcad6fb5240857e180f0c8ef0;
    stim[46] = 147'h74a94f982c3c5ef009472067693b7f4f0b242;
    stim[47] = 147'h455a2a7d749ee4a6798db9234272a3d6630b0;
    stim[48] = 147'h4fa150bd22151b5764fe8781ff6eccd11ef13;
    stim[49] = 147'h12d598f522b2236f743a2077026cad2e6c03a;
    stim[50] = 147'h07769e27d04f62a00ecbc1a70f6c504ebd020;
    stim[51] = 147'h5e49e6dec5d911c27b948bab61009cad67dca;
    stim[52] = 147'h1f6c8876165de4952f654b8dcc1d8801dfaad;
    stim[53] = 147'h109a9dbef0730b8aee2c3e183fc8e35d60640;
    stim[54] = 147'h5091230212de4afa65cec89508774a597ffda;
    stim[55] = 147'h38904fdee6d6c9a791e3ca73d74baef6197d9;
    stim[56] = 147'h1759dba9f60d0817a02d10d6a4fdff0b92e30;
    stim[57] = 147'h0a8a1ee947c73f1070618d58a00c8369d532b;
    stim[58] = 147'h26d8a88f4b07cfd775759c4d1e608e27b7dd9;
    stim[59] = 147'h5fbbc7ca5f4cf9dd794fbdca20bf1d6efc091;
    stim[60] = 147'h69be3f1fc9383532176bb4a05d172bfa28a03;
    stim[61] = 147'h7a63c6bf7036dff8dc127d6255db3c175b3b9;
    stim[62] = 147'h61107bdbd1253dcfd690aec3dc2b8565c8070;
    stim[63] = 147'h10ad0328730fc861f1513f40859228fae14e9;
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
      expv[0] = 128'hxxxxxxxx000000000000000000000000;
      expv[1] = 128'hxxxxxxxx000000000000000000000000;
      expv[2] = 128'hxxxxxxxx000000000000000000000000;
      expv[3] = 128'hxxxxxxxx000000000000000000000000;
      expv[4] = 128'hxxxxxxxx000000000000000000000000;
      expv[5] = 128'hxxxxxxxx000000000000000000000000;
      expv[6] = 128'hxxxxxxxx000000000000000000000000;
      expv[7] = 128'hxxxxxxxx000000000000000000000000;
      expv[8] = 128'hxxxxxxxx000000000000000000000000;
      expv[9] = 128'hxxxxxxxx000000000000000000000000;
      expv[10] = 128'hxxxxxxxx000000000000000000000000;
      expv[11] = 128'hxxxxxxxx000000000000000000000000;
      expv[12] = 128'hxxxxxxxx000000010000000100000000;
      expv[13] = 128'hxxxxxxxx000000010000000100000000;
      expv[14] = 128'hxxxxxxxx000000010000000100000000;
      expv[15] = 128'hxxxxxxxx000000010000000100000000;
      expv[16] = 128'hxxxxxxxx000000010000000100000000;
      expv[17] = 128'hxxxxxxxx000000010000000100000000;
      expv[18] = 128'hxxxxxxxx000000010000000100000000;
      expv[19] = 128'hxxxxxxxx000000010000000100000000;
      expv[20] = 128'hxxxxxxxx000000010000000100000000;
      expv[21] = 128'hxxxxxxxx000000010000000100000000;
      expv[22] = 128'hxxxxxxxx000000010000000100000000;
      expv[23] = 128'hxxxxxxxx000000010000000100000000;
      expv[24] = 128'hxxxxxxxx000000010000000100000000;
      expv[25] = 128'hxxxxxxxx000000010000000100000000;
      expv[26] = 128'hxxxxxxxx000000010000000100000000;
      expv[27] = 128'hxxxxxxxx000000010000000100000000;
      expv[28] = 128'hxxxxxxxx000000010000000100000000;
      expv[29] = 128'hxxxxxxxx000000000000000000000000;
      expv[30] = 128'hxxxxxxxx000000000000000000000000;
      expv[31] = 128'hxxxxxxxx000000000000000000000000;
      expv[32] = 128'hxxxxxxxx000000000000000000000000;
      expv[33] = 128'hxxxxxxxx000000010000000100000000;
      expv[34] = 128'hxxxxxxxx000000010000000100000000;
      expv[35] = 128'hxxxxxxxx000000010000000100000000;
      expv[36] = 128'hxxxxxxxx000000010000000100000000;
      expv[37] = 128'hxxxxxxxx000000010000000100000000;
      expv[38] = 128'hxxxxxxxx000000010000000100000000;
      expv[39] = 128'hxxxxxxxx000000010000000100000000;
      expv[40] = 128'hxxxxxxxx000000010000000100000000;
      expv[41] = 128'hxxxxxxxx000000010000000100000000;
      expv[42] = 128'hxxxxxxxx000000000000000000000000;
      expv[43] = 128'hxxxxxxxx000000000000000000000000;
      expv[44] = 128'hxxxxxxxx000000000000000000000000;
      expv[45] = 128'hxxxxxxxx000000010000000100000000;
      expv[46] = 128'hxxxxxxxx000000010000000100000000;
      expv[47] = 128'hxxxxxxxx000000010000000100000000;
      expv[48] = 128'hxxxxxxxx000000010000000100000000;
      expv[49] = 128'hxxxxxxxx000000010000000100000000;
      expv[50] = 128'hxxxxxxxx000000010000000100000000;
      expv[51] = 128'hxxxxxxxx000000010000000100000000;
      expv[52] = 128'hxxxxxxxx000000000000000000000000;
      expv[53] = 128'hxxxxxxxx000000000000000000000000;
      expv[54] = 128'hxxxxxxxx000000000000000000000000;
      expv[55] = 128'hxxxxxxxx000000000000000000000000;
      expv[56] = 128'hxxxxxxxx000000000000000000000000;
      expv[57] = 128'hxxxxxxxx000000000000000000000000;
      expv[58] = 128'hxxxxxxxx000000010000000100000000;
      expv[59] = 128'hxxxxxxxx000000010000000100000000;
      expv[60] = 128'hxxxxxxxx000000010000000100000000;
      expv[61] = 128'hxxxxxxxx000000010000000100000000;
      expv[62] = 128'hxxxxxxxx000000010000000100000000;
      expv[63] = 128'hxxxxxxxx000000010000000100000000;
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
