// Public tests: 64 cycles with the expected outputs written in. Generated; do not edit.
// Run: iverilog -g2012 -s tb -o sim public_tb.v <your .v files> && vvp sim
// Prints PASS N/N cycles, or MISMATCH lines (inputs/expected/got, packed in interface order) and FAIL.
// One stimulus word per cycle (inputs packed MSB-first, interface order); one expected word per cycle
// (outputs packed MSB-first). 'x' digits in expected.hex are don't care.
`timescale 1ns/1ps
module tb;
  localparam N = 64;
  localparam IW = 108;
  localparam OW = 105;
  reg [IW-1:0] stim [0:N-1];
  reg [OW-1:0] expv [0:N-1];
  reg [OW-1:0] act [0:N-1];
  reg [IW-1:0] in_vec;
  wire [OW-1:0] out_vec;
  reg clk;
  reg [8*1024-1:0] stim_file, exp_file, act_file;
  integer c, b, fd, mismatches, shown, bad;

  origen_154490 dut (
    .clk(clk),
    .rst_n(in_vec[107:107]),
    .cpu_wr(in_vec[106:106]),
    .cpu_rd(in_vec[105:105]),
    .cpu_byte(in_vec[104:101]),
    .cpu_addr(in_vec[100:69]),
    .cpu_wdata(in_vec[68:37]),
    .a_ready(in_vec[36:36]),
    .d_ready(in_vec[35:35]),
    .d_valid(in_vec[34:34]),
    .d_opcode(in_vec[33:32]),
    .d_data(in_vec[31:0]),
    .cpu_rdata_v(out_vec[104:104]),
    .cpu_rdata(out_vec[103:72]),
    .a_valid(out_vec[71:71]),
    .a_opcode(out_vec[70:69]),
    .a_mask(out_vec[68:65]),
    .a_address(out_vec[64:33]),
    .a_data(out_vec[32:1]),
    .trans_over(out_vec[0:0])
  );

  task sample;
    begin
      act[c] = out_vec;
    end
  endtask

  initial begin
    clk = 1'b0;
    in_vec = {IW{1'b0}};
    stim[0] = 108'h5d4158693ecd4892523e85e4539;
    stim[1] = 108'h56d3086e2653fc09e1eb2b4fef1;
    stim[2] = 108'hf934b546cdb157155d992b811f5;
    stim[3] = 108'hd63337c002b124373536128d5d9;
    stim[4] = 108'hb154703fcc41ad594493d6973fb;
    stim[5] = 108'he820ba235e2e15e830a1b52a5b7;
    stim[6] = 108'h994572c15afffff6ed33509418f;
    stim[7] = 108'h83c7bd0e6371b6825d93f5c4c22;
    stim[8] = 108'h86a15aebe171a4d91726bdbfc1b;
    stim[9] = 108'hfc6c220e5f4b68d7b26109167fc;
    stim[10] = 108'hf45a2a0002af90c78b9c3ddd368;
    stim[11] = 108'hbbf472f858537ba95c808030012;
    stim[12] = 108'haca6bc780a4b64dc954e8f8e23b;
    stim[13] = 108'hb82c64b88bc888a260e4039f46b;
    stim[14] = 108'hfdcc687ad48f63076f7abbcba95;
    stim[15] = 108'h86e0540f401efe52ec6f38c3986;
    stim[16] = 108'h961ca82592c8a5724d04b18f3c1;
    stim[17] = 108'hbf5e5673e6c21b5fd422bc5774b;
    stim[18] = 108'hac3e2fcfaf4b704fbb328148672;
    stim[19] = 108'h8dc66568e24a86055e4b68c2589;
    stim[20] = 108'hb5fd0da6892d7ac9fb03af8c185;
    stim[21] = 108'hda626d67f1638810465075aa5d6;
    stim[22] = 108'he34d3ee9d0042f1e116ecb45885;
    stim[23] = 108'h9a3519a3ab2c6aa9bebe48c47b1;
    stim[24] = 108'he93812de3da4a5e9284018a4b28;
    stim[25] = 108'hab5dcd3cb0d4cca8ccdb6242d86;
    stim[26] = 108'h8f2be08fe451173367285b4ff55;
    stim[27] = 108'he71a71250dec524a59246f12266;
    stim[28] = 108'hf17097b652a05a380754acb292c;
    stim[29] = 108'hd7eb72358366653ce5551769259;
    stim[30] = 108'hfb9f6906bfe79383a9eebf3079d;
    stim[31] = 108'hceb2087ee6c5dd910412f93d155;
    stim[32] = 108'hb7b9ce419b97e9f2d68b3a98666;
    stim[33] = 108'hf72ed6f804c5546eba8304f7e79;
    stim[34] = 108'hd42054536823e2914b475b14654;
    stim[35] = 108'h914b330f8673fa706060cb459f2;
    stim[36] = 108'hc478e72be848c4439b5ed72053e;
    stim[37] = 108'hd0619ee60832df16dfb11b31d70;
    stim[38] = 108'ha4cc1d830363f17c5e5b0e2b69f;
    stim[39] = 108'hc69557f99b02de8573b0fc1919e;
    stim[40] = 108'h823ca2bc4ba4da2a6346c83a7d5;
    stim[41] = 108'hf7a599e4b703b864bfc77a530c6;
    stim[42] = 108'hfaea091b41c1e2b62b5be689517;
    stim[43] = 108'hbfb13f01e9f6b735e397fcff7cf;
    stim[44] = 108'h9af69c8005b6275b77c973001e2;
    stim[45] = 108'hf74c215ac02bd9a770be273fa1b;
    stim[46] = 108'h8696f9fee8dd87c14dd5200f1f6;
    stim[47] = 108'hef84d4b1b3d6cbdb9fc114e276c;
    stim[48] = 108'hf202f9c747c3df053dfee146367;
    stim[49] = 108'hec1d084a34a914d85434bae5830;
    stim[50] = 108'hc1c1e87b48037c6c30b1c305a34;
    stim[51] = 108'h8d605baa088fdd81ed358c263ac;
    stim[52] = 108'hfe4ee2dae82470de91d3ffec934;
    stim[53] = 108'h8785caf5cf7201738801e94c120;
    stim[54] = 108'ha19867f40276fca7afa53f5d7b2;
    stim[55] = 108'hc3f1a8fb7e17e925c0b0bb4588d;
    stim[56] = 108'h8070ac03c7fb9de3d2b2a92811b;
    stim[57] = 108'hb8465c877cad0f4e6f7e202163a;
    stim[58] = 108'h993d2ec41590d3613d34103f499;
    stim[59] = 108'hffc52dd5078b062b4b3324dae06;
    stim[60] = 108'hd265bfce92b34e1278b38073be0;
    stim[61] = 108'ha9133330b97bbe11ff1fa2c77b4;
    stim[62] = 108'h92b1f54985d3c999a468e18ca30;
    stim[63] = 108'h8772913e89e57109b789eda07a0;
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
      expv[0] = 105'h000000000000000000000000000;
      expv[1] = 105'h000000000000000000000000000;
      expv[2] = 105'h000000000000000000000000000;
      expv[3] = 105'h000000000b934b546cdb157155c;
      expv[4] = 105'h000000000b934b546cdb157155c;
      expv[5] = 105'h000000000b934b546cdb157155c;
      expv[6] = 105'h000000000b934b546cdb157155c;
      expv[7] = 105'h000000000b934b546cdb157155c;
      expv[8] = 105'h000000000b934b546cdb157155c;
      expv[9] = 105'h000000000b934b546cdb157155c;
      expv[10] = 105'h000000000b934b546cdb157155c;
      expv[11] = 105'h000000000b934b546cdb157155c;
      expv[12] = 105'h000000000b934b546cdb157155c;
      expv[13] = 105'h000000000b934b546cdb157155c;
      expv[14] = 105'h14039f46bb934b546cdb157155d;
      expv[15] = 105'h14039f46bb934b546cdb157155d;
      expv[16] = 105'h04039f46b3934b546cdb157155c;
      expv[17] = 105'h04039f46b3934b546cdb157155c;
      expv[18] = 105'h04039f46b9f5e5673e7b157155c;
      expv[19] = 105'h04039f46b9f5e5673e7b157155c;
      expv[20] = 105'h04039f46b9f5e5673e7b157155c;
      expv[21] = 105'h04039f46b9f5e5673e7b157155c;
      expv[22] = 105'h04039f46b9f5e5673e7b157155c;
      expv[23] = 105'h04039f46b9f5e5673e7b157155c;
      expv[24] = 105'h04039f46b9f5e5673e7b157155c;
      expv[25] = 105'h04039f46b9f5e5673e7b157155c;
      expv[26] = 105'h1b6242d869f5e5673e7b157155d;
      expv[27] = 105'h1b6242d869f5e5673e7b157155d;
      expv[28] = 105'h0b6242d86a71a71250dec524a58;
      expv[29] = 105'h0b6242d86a71a71250dec524a58;
      expv[30] = 105'h0b6242d86a71a71250dec524a58;
      expv[31] = 105'h1ebf3079da71a71250dec524a59;
      expv[32] = 105'h1ebf3079da71a71250dec524a59;
      expv[33] = 105'h0ebf3079d97b9ce419bec524a58;
      expv[34] = 105'h0ebf3079d97b9ce419bec524a58;
      expv[35] = 105'h0ebf3079d97b9ce419bec524a58;
      expv[36] = 105'h0ebf3079d97b9ce419bec524a58;
      expv[37] = 105'h0ebf3079d97b9ce419bec524a58;
      expv[38] = 105'h0ebf3079d97b9ce419bec524a58;
      expv[39] = 105'h0ebf3079d97b9ce419bec524a58;
      expv[40] = 105'h0ebf3079d97b9ce419bec524a58;
      expv[41] = 105'h0ebf3079d97b9ce419bec524a58;
      expv[42] = 105'h177a530c697b9ce419bec524a59;
      expv[43] = 105'h177a530c697b9ce419bec524a59;
      expv[44] = 105'h077a530c69fb13f01e9ec524a58;
      expv[45] = 105'h1973001e29fb13f01e9ec524a59;
      expv[46] = 105'h1973001e29fb13f01e9ec524a59;
      expv[47] = 105'h0973001e21fb13f01e9ec524a58;
      expv[48] = 105'h0973001e2af84d4b1b3d6cbdb9e;
      expv[49] = 105'h1ee146367af84d4b1b3d6cbdb9f;
      expv[50] = 105'h1ee146367af84d4b1b3d6cbdb9f;
      expv[51] = 105'h0ee146367a1c1e87b48037c6c30;
      expv[52] = 105'h0ee146367a1c1e87b48037c6c30;
      expv[53] = 105'h13ffec934a1c1e87b48037c6c31;
      expv[54] = 105'h13ffec934a1c1e87b48037c6c31;
      expv[55] = 105'h03ffec934819867f402037c6c30;
      expv[56] = 105'h03ffec934819867f402037c6c30;
      expv[57] = 105'h03ffec934819867f402037c6c30;
      expv[58] = 105'h03ffec934819867f402037c6c30;
      expv[59] = 105'h03ffec934819867f402037c6c30;
      expv[60] = 105'h03ffec934819867f402037c6c30;
      expv[61] = 105'h03ffec934819867f402037c6c30;
      expv[62] = 105'h03ffec934819867f402037c6c30;
      expv[63] = 105'h03ffec934819867f402037c6c30;
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
