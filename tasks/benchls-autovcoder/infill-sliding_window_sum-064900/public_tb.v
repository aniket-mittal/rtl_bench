// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 60;
  localparam OW = 67;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  autovcoder_064900 dut (
    .clk(clk),
    .rst_n(in_vec[59:59]),
    .Iq(in_vec[58:51]),
    .Is(in_vec[50:43]),
    .valid_in(in_vec[42:42]),
    .rdata1(in_vec[41:21]),
    .rdata2(in_vec[20:0]),
    .SigIi(out_vec[66:49]),
    .valid_out(out_vec[48:48]),
    .wen(out_vec[47:47]),
    .ren1(out_vec[46:46]),
    .ren2(out_vec[45:45]),
    .waddr(out_vec[44:37]),
    .raddr1(out_vec[36:29]),
    .raddr2(out_vec[28:21]),
    .wdata(out_vec[20:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 60'h2a0f6f67544974c;
    stim[1] = 60'h048daa04b039727;
    stim[2] = 60'hfd6892a15d54aac;
    stim[3] = 60'hf757fe1e3eddec0;
    stim[4] = 60'h98b14bf9c9ae58a;
    stim[5] = 60'he6120b942fb3c2a;
    stim[6] = 60'haca6c3e2b01f721;
    stim[7] = 60'hc4c62a17461670f;
    stim[8] = 60'h842cbe852d9e1d9;
    stim[9] = 60'hc9c7e9374ca3cb0;
    stim[10] = 60'ha9ff357342ddfc4;
    stim[11] = 60'hff6814b70724c73;
    stim[12] = 60'hde1c1878358d4d4;
    stim[13] = 60'hd69f9971964370d;
    stim[14] = 60'ha0e8f9181a00f85;
    stim[15] = 60'hda3da86f225c792;
    stim[16] = 60'hdf489fb85193f7f;
    stim[17] = 60'hac7bd8cb41ea5f6;
    stim[18] = 60'he22ed4cdd736524;
    stim[19] = 60'hea508a43e2a0e15;
    stim[20] = 60'he6a1a8969c1d5af;
    stim[21] = 60'ha13803c5dd666ad;
    stim[22] = 60'h84d8459fe7b8435;
    stim[23] = 60'hde1cf468baeb5fc;
    stim[24] = 60'h9aae15281c4b584;
    stim[25] = 60'h9595b89c2f7c24c;
    stim[26] = 60'h95e27038de2c899;
    stim[27] = 60'h9f38235f2397a0d;
    stim[28] = 60'hfd55f65efa5c1f9;
    stim[29] = 60'h82ff62a6b938cfc;
    stim[30] = 60'had8a13b774b9e66;
    stim[31] = 60'h9ef8d6eeee9d33d;
    stim[32] = 60'ha73222a310ce336;
    stim[33] = 60'hc4473433d46a2f1;
    stim[34] = 60'haf4e746ecba6c0d;
    stim[35] = 60'ha3127e6f75ad114;
    stim[36] = 60'heb59179ea1fcdd9;
    stim[37] = 60'h92a4c5088174377;
    stim[38] = 60'hd328b6973db05cb;
    stim[39] = 60'hd02d6780586d828;
    stim[40] = 60'h8cc37d25b0e6448;
    stim[41] = 60'ha1a16a54241b488;
    stim[42] = 60'ha86303f5baff1ee;
    stim[43] = 60'h8812e56f2cb6dba;
    stim[44] = 60'h8565b58ce7795e3;
    stim[45] = 60'h883e36956930071;
    stim[46] = 60'hde2228769003c4d;
    stim[47] = 60'h86fc71a604e1aa3;
    stim[48] = 60'ha146482403d4e44;
    stim[49] = 60'hfd85c4a3dc8ad69;
    stim[50] = 60'h8b7fd4914c7ba31;
    stim[51] = 60'hc3c165d6a766f17;
    stim[52] = 60'h9ac45994b108ea3;
    stim[53] = 60'hba61b543371194c;
    stim[54] = 60'hbc12790dfa6887a;
    stim[55] = 60'hd4c9ed3e115047f;
    stim[56] = 60'h23ae35e2dec575e;
    stim[57] = 60'hd5676556184692f;
    stim[58] = 60'hfc7560388c221aa;
    stim[59] = 60'hf966517df47463e;
    stim[60] = 60'hed10c614c5c1099;
    stim[61] = 60'hef571b2581b2cf2;
    stim[62] = 60'h8b75d3348a40025;
    stim[63] = 60'h9010cc205b848d0;
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
      expv[0] = 67'h00000e0003c40001e;
      expv[1] = 67'h0000060001c20001b;
      expv[2] = 67'h0000060001c3fffd1;
      expv[3] = 67'h00000e0003c5fffaf;
      expv[4] = 67'h7ffa2e0205c600011;
      expv[5] = 67'h7ff5e60405c600035;
      expv[6] = 67'h00022e0407c800082;
      expv[7] = 67'h0006a60607c80000e;
      expv[8] = 67'h0010460607c800067;
      expv[9] = 67'h0001ce0609cbffff6;
      expv[10] = 67'h000ce60809cbffff4;
      expv[11] = 67'h7ffec60809cbfffc4;
      expv[12] = 67'h7ffe860809cbffffc;
      expv[13] = 67'h7ff8860809ca0003b;
      expv[14] = 67'h7fff8e080bcc0000c;
      expv[15] = 67'h0007660a0bcc00087;
      expv[16] = 67'h0001860a0bcc00018;
      expv[17] = 67'h0010ee0a0dce0000f;
      expv[18] = 67'h00030e0c0fd00006c;
      expv[19] = 67'h0001e60e0fd00000d;
      expv[20] = 67'h000d860e0fd000050;
      expv[21] = 67'h0001a60e0fd0000c0;
      expv[22] = 67'h000a0e0e11d200070;
      expv[23] = 67'h00180e1013d4000a9;
      expv[24] = 67'h000e061213d400105;
      expv[25] = 67'h0015261213d400130;
      expv[26] = 67'h0020ae1215d6000f4;
      expv[27] = 67'h0026061415d600164;
      expv[28] = 67'h001e8e1417d80010f;
      expv[29] = 67'h002c8e1619da0010d;
      expv[30] = 67'h0021e61819da00121;
      expv[31] = 67'h0021ae181bdc00112;
      expv[32] = 67'h0024261a1bdc00176;
      expv[33] = 67'h0022461a1bdc00104;
      expv[34] = 67'h002ece1a1dde000a0;
      expv[35] = 67'h00208e1c1fe0000c4;
      expv[36] = 67'h0014061e1fe000076;
      expv[37] = 67'h00188e1e21e2000bf;
      expv[38] = 67'h000ec62021e200110;
      expv[39] = 67'h0017ee2023e40016a;
      expv[40] = 67'h00220e2225e6000f0;
      expv[41] = 67'h002d4e2427e800132;
      expv[42] = 67'h001e062627e8000f8;
      expv[43] = 67'h00264e2629ea0011d;
      expv[44] = 67'h001f062829ea000e8;
      expv[45] = 67'h0023a62829ea00164;
      expv[46] = 67'h001d062829ea001a8;
      expv[47] = 67'h002c8e282bec001a0;
      expv[48] = 67'h00350e2a2dee0012c;
      expv[49] = 67'h00340e2c2ff000137;
      expv[50] = 67'h00258e2e31f200136;
      expv[51] = 67'h0026ee3033f4000b8;
      expv[52] = 67'h0026ce3235f600040;
      expv[53] = 67'h0017063435f600003;
      expv[54] = 67'h00080e3437f800027;
      expv[55] = 67'h00006e3639fbfffba;
      expv[56] = 67'h0000060001c20005c;
      expv[57] = 67'h00000e0003c5fffce;
      expv[58] = 67'h00000e0205c7fffb8;
      expv[59] = 67'h7ff9ce0407c9fff84;
      expv[60] = 67'h7ff70e0609cbfffa5;
      expv[61] = 67'h7ff0860809cbfff53;
      expv[62] = 67'h7ff4ae080bcdfff3e;
      expv[63] = 67'h7fea6e0a0dcffff5f;
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
