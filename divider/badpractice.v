// Working copy but bad practise using blocking assignments
//    always @ (posedge clk) begin
//            temp_ra = ra - temp;

//            c<=c+1;
//            if (c<4) begin
//                ra = ra << 1; // assumes this is sequential
    
//                if (ra[7:4] >= B) begin //if (R>=B)
//                    ra = (ra - temp) | (8'h01);// R = R-b, and store q into the lower end of ra;
//                end
    
//                else ra = ra | (8'h00); // redundant
            
//            end
            
//            else done <= 1;
//        end
        
